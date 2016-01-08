require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require_relative '../lib/title_reformatter.rb'

require 'csv'
require 'pry'

def csv_header_alteration(file)
	input = File.open(file, 'r')
	output = File.open("#{file.insert(-5, '_titled')}", 'w')
	estimate = create_hash(format_estimate_array)
	margin = create_hash(format_margin_of_error_array)

	CSV.filter(input, output, :headers => true, 
		:write_headers => true, :return_headers => true) do |row|
		if row.header_row? 
			row.headers.each_with_index do |column_id, i|
				if estimate.has_key?(column_id)
					row[i] = estimate[column_id]
				elsif margin.has_key?(column_id)
					row[i] = margin[column_id]
				end
			end
		end
	end
	input.close
	output.close

end
