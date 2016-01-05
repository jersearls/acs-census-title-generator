require_relative '../lib/column_name_generator.rb'
require 'csv'
require 'pry'

#creates a hash with table id as the key and title as the value
def create_table_info(filename)
	Hash[load_csv(filename).map do |row|
		[row[:table_id], row[:table_title]]
	end]
end

#calls and assigns table_name array
def get_table_info
	create_table_info('../data/census_table_metadata.csv')
end


def combine_columns_and_table_names
	table_names = get_table_info
	columns = create_column_data
	columns.each do |column|
		column[:full_title] = "#{table_names[column[:table_id]]}_#{column[:title]}"
	end
	return columns
end

def reformat_titles
	title_info = combine_columns_and_table_names
	column_hash = {}
	title_info.map do |info| 
		column_hash = {title: info[:full_title].downcase.gsub(/[^A-Za-z0-9,:,.]+/,'_').
		gsub(/^_/, '').gsub(/_$/, ''), table_id: info[:table_id], col_id: info[:col_id]}
	end
	
end




binding.pry
