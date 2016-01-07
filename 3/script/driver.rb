require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require_relative '../lib/csv_reformatter.rb'
require_relative '../lib/csv_generator.rb'
require 'csv'
require 'pry'

files = Dir.entries('../data/acs')
files = files[2..-1]
p files
puts files.length

files.each do |file|
  csv_header_alteration('../data/acs/'+file)
  puts "One more done!"
  p file
end








