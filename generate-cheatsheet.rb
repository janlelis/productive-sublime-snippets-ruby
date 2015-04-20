#!/usr/bin/env ruby

require "nokogiri"

snippets = {}
title = "#{ARGV[0]} Cheat Sheet"

Dir["*.sublime-snippet"].each{ |filename|
  xml = Nokogiri::XML(File.read(filename))
  snippets[xml.css('tabTrigger').text] = xml.css('description').text
}

puts <<-BANNER + snippets.sort.map{ |trigger, description| "% 15s | %s" % [trigger, description] }*"\n"
# #{title}

        Trigger | Description
----------------|------------
BANNER
