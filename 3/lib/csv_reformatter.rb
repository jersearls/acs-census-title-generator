
require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'

require 'csv'
require 'pry'

#Reformats full_title to match CSV table headers. 
#Inserts "e" for estimate and removes extra 0s
def format_estimate_array
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'e')
	  	titles[:col_id].slice!(-3) if titles[:col_id][-3] == "0"
		titles[:col_id].slice!(-2) if titles[:col_id][-2] == "0"	
	end
	return titles
end

#Reformats full_title to match CSV table headers. 
#Inserts "m" for estimate and removes extra 0s
#Adds string to beginning of titles
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

#Creates a hash with col_id as key, and newly reformatted titles as the value
def create_hash(method)
	titles = method

	Hash[titles.map do |row|
		[row[:col_id], row[:title]]
		end
	]	
end


