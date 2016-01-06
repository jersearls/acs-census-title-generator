
require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'

require 'csv'
require 'pry'

def format_estimate_array
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'e')
	  
		titles[:col_id].slice!(-3) if titles[:col_id][-3] == "0"

		titles[:col_id].slice!(-2) if titles[:col_id][-2] == "0"	
	end
	return titles
end

def format_margin_of_error_array
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'm')
	  
		titles[:col_id].slice!(-3) if titles[:col_id][-3] == "0"

		titles[:col_id].slice!(-2) if titles[:col_id][-2] == "0"

		titles[:title].insert(0, 'margin_of_error:')
	end

	return titles
end

def create_hash(method)
	titles = method

	Hash[titles.map do |row|
		[row[:col_id], row[:title]]
		end
	]	
end

#create_hash(format_estimate_array)
#create_hash(format_margin_of_error_array)

