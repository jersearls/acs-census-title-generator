require 'csv'
require 'pry'

#loads csv file and creates a hash from each row
def load_csv(filename)
  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end
  CSV.new(File.read(filename), 
    :headers => true, 
    :header_converters => :symbol, 
    :converters => [:all, :blank_to_nil]
  ).entries.map { |row| row.to_hash }
	end

#creates a new hash with the column id as the key and an array containing column title and a 
#nested array of the parent hash
def create_column_types(filename)
column_types = {}
	
	load_csv(filename).map do |row|
	column_types[row[:column_id]] =
	row[:column_title],
	column_types[row[:parent_column_id]]
	end

end

#calls method and saves output of .map

column_types = create_column_types('columndatatest.csv')

#displays an array of only the titles in the correct logical order	
processed_titles = column_types.reverse.map { |o|
		o.flatten.compact.reverse.join
	}

puts processed_titles

binding.pry

#########################
# Questions:
# How can I save the values that are created as the csv is iterated over? CLass?
# Then call those values to simply concatenate into logical string


