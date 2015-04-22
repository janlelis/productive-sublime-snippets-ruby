#!/usr/bin/env ruby

require "nokogiri"

snippets = {}
title = "#{ARGV[0]} Cheat Sheet"

Dir["*.sublime-snippet"].each{ |filename|
  xml = Nokogiri::XML(File.read(filename))
  snippets[xml.css('tabTrigger').text] = [
    xml.css('description').text,
    xml.css('content').children[0].text =~ /SELECTION/,
  ]
}

banner = <<BANNER
# #{title}

        Trigger |                                        Description | Wrappable?
----------------|----------------------------------------------------| ----------
BANNER

puts banner + snippets.sort.map{ |trigger, (description, wrapable)|
  "% 15s | % 50s |%s" % [
    trigger,
    description.gsub("__", "\\_\\_"),
    wrapable ? " X" : ""
  ]
}*"\n"
