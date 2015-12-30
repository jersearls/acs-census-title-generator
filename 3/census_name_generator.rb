require 'csv'

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
	
	load_csv(filename).each do |row|
	column_types[row[:column_id]] = 
	row[:column_title],
	column_types[row[:parent_column_id]]
	

	end

#displays an array of only the titles in the correct logical order
	puts column_types.values.flatten.reverse



end

#calls method

create_column_types('columndatatest.csv')

#########################
# Questions:
# How can I save the values that are created as the csv is iterated over?
# Then call those values to simply concatenate into logical string


