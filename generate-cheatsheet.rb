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

|             Trigger |                                        Description |
|---------------------|----------------------------------------------------|
BANNER

puts banner + snippets.sort.map{ |trigger, (description, wrapable)|
  "|% 20s | % 50s |" % [
    trigger,
    description.gsub("__", "\\_\\_"),
    # wrapable ? " X" : ""
  ]
}*"\n" + "\n\n[X] == wrappable around current selection"
