require_relative '../lib/column_name_generator.rb'
require 'csv'
require 'pry'


#creates a hash with table id as the key and title as the value
def create_table_info(filename)
	table_hash = {}
	load_csv(filename).map do |row|
	table_hash = {row[:table_id] => row[:table_title]}
	end
end

#calls and assigns table_name array
def get_table_info
	table_name = 
	create_table_info('../data/census_table_metadata.csv')
end

def add_table_title_to_col_array
	create_column_data_hash.map do |hash| hash[0][:table_id] = 
		get_table_info
	end
	
end

binding.pry
