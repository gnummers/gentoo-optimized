#!/usr/bin/env python
# This script retrieves symbols from the Mozilla project's symbol server.
# see https://developer.mozilla.org/en/Using_the_Mozilla_symbol_server
# usage: fetch-symbols <firefox install dir> <symbol server URL> <path to store in>
# then, in gdb, you will need to do:
#  set debug-file-directory <path>
# Where <path> matches the path you passed to this script above.

import sys
import urllib
import urlparse
import os.path
import re
from subprocess import check_call
from ConfigParser import ConfigParser
import platform

if len(sys.argv) != 4:
  print >>sys.stderr, "usage: %s <firefox install dir> <symbol server URL> <path to store in>" % sys.argv[0]
  print >>sys.stderr, "The symbol server URL should probably be http://symbols.mozilla.org/"
  sys.exit(1)

(install_dir, symbol_server_url, symbol_path) = sys.argv[1:]

appini = os.path.join(install_dir, "application.ini")
if not os.path.isfile(appini):
  print >>sys.stderr, "No application.ini found in %s. Did you pass the right path to your Firefox install dir?" % install_dir
  sys.exit(1)
  
if not os.path.isdir(symbol_path):
  print >>sys.stderr, "%s is not a directory" % symbol_path
  sys.exit(1)

# read info out of application.ini
c = ConfigParser()
c.read(appini)
# guess at the extra bits
extra = ''
if platform.machine() == 'x86_64' and platform.system() == 'Linux':
  extra = '-linux64'
repo = c.get("App", "SourceRepository")
if not repo.endswith("mozilla-central"):
  extra += '-' + repo.split('/')[-1]

indexurl = urlparse.urljoin(symbol_server_url,
                            "%(app)s/%(app)s-%(ver)s-%(os)s-%(buildid)s%(extra)s-symbols.txt" % \
                              {"app": c.get("App", "Name").lower(),
                               "ver": c.get("App", "Version"),
                               "os": platform.system(),
                               "buildid": c.get("App", "BuildID"),
                               "extra": extra
                               })

symbols = []
try:
  print "Fetching symbol index %s" % indexurl
  u = urllib.urlopen(indexurl)
  if u.getcode() != 200:
    print >>sys.stderr, "HTTP error %s retrieving %s" % (u.getcode(), indexurl)
    sys.exit(2)
  for line in u:
    line = line.strip()
    if line.endswith(".dbg.gz"):
      symbols.append(line)
  u.close()
except IOError:
  print >>sys.stderr, "Couldn't read symbol index at %s" % indexurl
  sys.exit(1)

def find_file_path(d, f):
  """Find the absolute path containing file |f| in directory |d|."""
  d = os.path.abspath(d)
  for dirpath, dirnames, filenames in os.walk(d):
    if f in filenames:
      return dirpath
  return d

for sym in symbols:
  symurl = urlparse.urljoin(indexurl, sym)
  symfile = os.path.basename(sym)
  # for some reason, gdb needs to locate symbols like so:
  # If the binary you're debugging is /home/luser/foo/prog, and
  # you set debug-file-directory /tmp/symbols, then gdb will look for
  # /tmp/symbols/home/luser/foo/prog.dbg . This is kind of complicated.
  symdest = os.path.join(symbol_path,
                         # drop the leading slash
                         find_file_path(install_dir, symfile[:-7])[1:],
                         symfile)
  try:
    os.makedirs(os.path.dirname(symdest))
  except:
    pass
  print "%s -> %s" % (symfile, symdest)
  try:
    urllib.urlretrieve(symurl, symdest)
    check_call(["gzip", "-d", symdest])
  except IOError:
    print >>sys.stderr, "Failed to download %s" % symurl
print "Done.\nRemember to 'set debug-file-directory %s' in gdb." % symbol_path
