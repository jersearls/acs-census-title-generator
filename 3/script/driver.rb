require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require_relative '../lib/csv_reformatter.rb'
require_relative '../lib/csv_generator.rb'
require 'csv'
require 'pry'

files = Dir['../data/acs/*.csv']
p files
puts files.length

files.each do |file|
  csv_header_alteration(file)
  puts "One more done!"
  p file
end








