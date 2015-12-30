require 'csv'
require 'pry'

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

def create_column_types(filename)
column_types = {}
	
	load_csv(filename).each do |row|
	column_types[row[:column_id]] = 
	row[:column_id],
	row[:column_title],
	column_types[row[:parent_column_id]]
	end
puts column_types
#find? need to search for parent

end

create_column_types('columndatatest.csv')


