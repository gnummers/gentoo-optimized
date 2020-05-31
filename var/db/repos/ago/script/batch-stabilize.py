#!/usr/bin/env python
# Copyright 2011-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

import glob
import itertools
import optparse
import os
import pickle
import re
import shutil
import subprocess
import sys

import bugz.bugzilla
import portage.versions

BUG_REGEX = re.compile("[Bb]ug #?(\d+)")

def print_and_log(message, log):
	try:
		print message
		log.write(message + '\n')
	finally:
		log.flush()

def run_command(args, cwd, log):
	try:
		message = "Running %r in %s...\n" % (args, cwd)
		sys.stdout.write(message)
		log.write(message)

		cmd  = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
		output = cmd.communicate()[0]
		log.write("Finished with exit code %d\n" % cmd.returncode)
		log.write(output)
		return (cmd.returncode, output)
	finally:
		log.flush()

def save_state(done_bugs):
	with open('batch-stabilize.state', 'w') as state_file:
		pickle.dump(done_bugs, state_file)

class MyBugz(bugz.bugzilla.Bugz):
	def get_input(self, prompt):
		return raw_input(prompt)

if __name__ == "__main__":
	parser = optparse.OptionParser()
	parser.add_option("--arch", dest="arch", help="Gentoo arch to use, e.g. x86, amd64, ...")
	parser.add_option("-i", "--input", dest="input_filename", default="package.keywords", help="Input filename for generated package.keywords file [default=%default]")
	parser.add_option("--repo", dest="repo", help="Path to portage CVS repository")
	parser.add_option("-v", "--verbose", dest="verbose", action="store_true", default=False)

	(options, args) = parser.parse_args()
	if not options.arch:
		parser.error("--arch option is required")
	if not options.input_filename:
		parser.error("--input option is required")
	if not options.repo:
		parser.error("--repo option is required")
	if args:
		parser.error("unrecognized command-line args")

	done_bugs = []
	if os.path.exists('batch-stabilize.state'):
		with open('batch-stabilize.state', 'r') as state_file:
			done_bugs = pickle.load(state_file)

	url = 'https://bugs.gentoo.org'
	print 'You may be prompted for your Gentoo Bugzilla username and password (%s).' % url
	bugzilla = MyBugz(url)
	bugzilla.auth()
	
	with open(options.input_filename, "r") as input_file:
		stabilization_dict = {}
		bug_id = -1
		for line in input_file:
			line = line.strip()

			# Skip empty/whitespace lines.
			if not line:
				continue

			if line.startswith("#"):
				match = BUG_REGEX.search(line, re.IGNORECASE)
				if not match:
					print 'Ignoring comment line [%s]...' % line
					continue
				else:
					bug_id = int(match.group(1))
				continue

			if bug_id == -1:
				print 'Could not recognize bug id'
				sys.exit(1)

			# Drop the leading '='.
			cpv = line[1:]

			p = portage.versions.catsplit(cpv)[1]
			pn = portage.versions.pkgsplit(cpv)[0]
			ebuild_name = p + ".ebuild"
			if bug_id not in stabilization_dict:
				stabilization_dict[bug_id] = []
			stabilization_dict[bug_id].append((pn, ebuild_name))

		# Sanity check.
		success = True
		for bug_id in stabilization_dict:
			for (pn, ebuild_name) in stabilization_dict[bug_id]:
				ebuild_path = os.path.join(options.repo, pn, ebuild_name)
				if not os.path.exists(ebuild_path):
					print '%s: file does not exist' % ebuild_path
					success = False
		if not success:
			print 'Sanity check failed. Please make sure your CVS repo is up to date (cvs up).'
			sys.exit(1)

		with open('batch-stabilize.log', 'a') as log_file:
			for bug_id in stabilization_dict:
				if bug_id in done_bugs:
					print_and_log('Skipping bug #%d because it is marked as done.' % bug_id, log_file)
					continue

				print_and_log('Working on bug %d...' % bug_id, log_file)
				commit_message = "Stable for %s, wrt bug #%d" % (options.arch, bug_id)
				for (pn, ebuild_name) in stabilization_dict[bug_id]:
					cvs_path = os.path.join(options.repo, pn)
					print_and_log('Working in %s...' % cvs_path, log_file)

					if run_command(["ekeyword", options.arch, ebuild_name], cvs_path, log_file)[0] != 0:
						print '!!! ekeyword failed'
						sys.exit(1)
					if run_command(["repoman", "manifest"], cvs_path, log_file)[0] != 0:
						print '!!! repoman manifest failed'
						sys.exit(1)
				for (pn, ebuild_name) in stabilization_dict[bug_id]:
					cvs_path = os.path.join(options.repo, pn)
					print_and_log('Working in %s...' % cvs_path, log_file)
					return_code, output = run_command(["cvs", "diff"], cvs_path, log_file)
					# It seems that cvs diff returns 1 if there are differences.
					if return_code == 0 and not output:
						print_and_log('Seems already keyworded, skipping.', log_file)
						done_bugs.append(bug_id)
						save_state(done_bugs)
						continue
					if run_command(["repoman", "commit", "--include-arches", options.arch, "-m", commit_message], cvs_path, log_file)[0] != 0:
						os.chdir(cvs_path)
						os.system("repoman full")
						sys.exit(1)
				bug_xml = bugzilla.get(bug_id).find('bug')
				has_my_arch = False
				has_other_arches = False
				for cc in bug_xml.findall('cc'):
					body, domain = cc.text.split('@', 1)
					if domain == 'gentoo.org' and body == options.arch:
						has_my_arch = True
					if domain == 'gentoo.org' and body in portage.archlist and body != options.arch:
						has_other_arches=True

				if not has_my_arch:
					print_and_log('Seems that bugzilla has already been updated.', log_file)
					done_bugs.append(bug_id)
					save_state(done_bugs)
					continue

				print_and_log('Posting automated reply in bugzilla...', log_file)
				# We don't close bugs which still have other arches for obvious reasons,
				# and security bugs because stabilization is not the last step for them.
				if has_other_arches or 'Security' in bug_xml.find('product').text:
					bugzilla.modify(
						bug_id,
						comment='%s stable' % options.arch,
						remove_cc='%s@gentoo.org' % options.arch)
					print_and_log('Successfully updated bug %d.' % bug_id, log_file)
				else:
					bugzilla.modify(
						bug_id,
						comment='%s stable. Last arch, closing' % options.arch,
						remove_cc='%s@gentoo.org' % options.arch,
						status='RESOLVED',
						resolution='FIXED')
					print_and_log('Succesfully updated bug %d and closed it.' % bug_id, log_file)

				done_bugs.append(bug_id)
				save_state(done_bugs)
	
	if os.path.exists('batch-stabilize.state'):
		os.remove('batch-stabilize.state')
