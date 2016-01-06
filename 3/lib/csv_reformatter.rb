
require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require 'csv'
require 'pry'

def create_estimate_hash
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'e')
	  
		titles[:col_id].slice!(-3) if titles[:col_id][-3] == "0"

		titles[:col_id].slice!(-2) if titles[:col_id][-2] == "0"	
	end

	return titles
			

end

def create_margin_of_error_hash
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'm')
	  
		titles[:col_id].slice!(-3) if titles[:col_id][-3] == "0"

		titles[:col_id].slice!(-2) if titles[:col_id][-2] == "0"

		titles[:title].insert(0, 'margin_of_error:')
	end

	return titles
end


binding.pry