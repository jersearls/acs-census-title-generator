require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require_relative '../lib/csv_reformatter.rb'
require_relative '../lib/csv_generator.rb'
require 'csv'
require 'pry'

files = Dir['../data/acs/*.csv']
total = Dir['../data/acs/*.csv'].length
count = 0
puts "#{total} Files Found"

files.each do |file|
  count += 1
  csv_header_alteration(file)
  p file
  puts "File re-titled."
  percentage = (count / total.to_f) * 100
  puts "#{sprintf('%.2f', percentage)}% Complete"

end








