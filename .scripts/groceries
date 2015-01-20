#!/usr/bin/env ruby

require 'grocery_list'

# make sure arguments are ok
unless ARGV.length <= 2 && ARGV.length > 0
  puts "Wrong number of arguments"
  puts "Usage: example.rb [source] [:sort-option]"
  exit
end

# parse input arguments
input_source = ARGV[0]
sort_option = ARGV[1].to_sym unless ARGV.length < 2

# search
GroceryList.search_all(input_source, GroceryList::IGASearcher.new(sort_option || :priceAsc))
