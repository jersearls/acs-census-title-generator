require_relative '../lib/census_name_generator.rb'
require 'csv'
require 'pry'


#creates an array of full table titles
def create_table_name(filename)
	load_csv(filename).map do |row|
	row[:table_title]
	end

end

#calls and assigns table_name array
def get_table_name
	table_name = 
	create_table_name('../data/census_table_metadata.csv')
end

binding.pry
