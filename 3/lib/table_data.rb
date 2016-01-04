require_relative '../lib/census_name_generator.rb'
require 'csv'
require 'pry'


#creates an array of full table titles
def create_table_info(filename)
	table = []
	load_csv(filename).map do |row|
	table = [row[:table_title], row[:table_id]]
	end
end

#calls and assigns table_name array
def get_table_info
	table_name = 
	create_table_name('../data/census_table_metadata.csv')
end

column_array = create_column_data_array

column_array.map{ |columns|
	if o[1] == 
}



binding.pry
