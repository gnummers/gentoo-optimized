#!/usr/bin/env ruby

require 'find'
require 'json'

root = File.join(File.dirname(__FILE__), '..')

content = {}
Find.find(root) do |path|
  next unless path =~ /ebuild$/
  category, name, file = path.sub(root + '/', '').split('/', 3)
  matches = file.match(/#{name}-(?<version>\S+).ebuild/)

  ebuild = []
  File.open(path, 'r').readlines.each do |line|
    next unless line =~ /(DESCRIPTION|HOMEPAGE)/
    ebuild << line.chomp.split('=', 2).map { |i| i.tr('"', '') }
  end
  ebuild = ebuild.to_h

  content[category] = {} unless content[category]
  content[category][name] = {} unless content[category][name]
  content[category][name]['description'] = ebuild['DESCRIPTION']
  content[category][name]['homepage'] = ebuild['HOMEPAGE']
  content[category][name]['version'] = [] unless content[category][name]['version']
  content[category][name]['version'] << matches['version']
end

File.open(File.join(root, 'README.md'), 'w') do |f|
  f.puts "## Usage\n\n    layman -f\n    layman -a scrill\n\n"
  f.puts "## Content\n\n"
  JSON.pretty_generate(content).split("\n").each do |line|
    f.puts '    ' + line
  end
end
