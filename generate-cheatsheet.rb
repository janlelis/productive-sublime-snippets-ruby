#!/usr/bin/env ruby

require "nokogiri"

snippets = {}
title = "#{ARGV[0]} Cheat Sheet"

Dir["*.sublime-snippet"].each{ |filename|
  xml = Nokogiri::XML(File.read(filename))
  snippets[xml.css('tabTrigger').text] = xml.css('description').text
}



banner = <<BANNER
# #{title}

        Trigger | Description
----------------|------------
BANNER

puts banner + snippets.sort.map{ |trigger, description|
  "% 15s | %s" % [trigger, description.gsub("__", "\\_\\_")]
}*"\n"
