#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
require 'json'
require 'rss'
require 'open-uri'

url = 'https://hnrss.org/newest'

items = []

URI.open(url) do | rss |
    feed = RSS::Parser.parse(rss)
    feed.items.each do | item |
        post = {}
        post['title'] = item.title
        # post['subtitle'] = item.description
        post['url'] = item.link
        post['icon'] = 'font-awesome:fa-hacker-news'
        items.push(post)
    end
end

puts items.to_json
