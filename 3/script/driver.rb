require_relative '../lib/column_name_generator.rb'
require_relative '../lib/full_title_generator.rb'
require_relative '../lib/csv_reformatter.rb'

require 'csv'
require 'pry'

def csv_header_alteration
	input = File.open('../data/sf0039wv.csv', 'r')
	output = File.open('../data/TESTcsv.csv', 'w')
	estimate = create_hash(format_estimate_array)

	CSV.filter(input, output, :headers => true, 
		:write_headers => true, :return_headers => true) do |row|
		if row.header_row? 
			row.headers.each_with_index do |column_id, i|
				if estimate.has_key?(column_id)
					row[i] = estimate[column_id]
				end
			end
		end
	end

	input.close
	output.close
	

end


def change_headers(row)
	estimate = create_hash(format_estimate_array)

end

csv_header_alteration


