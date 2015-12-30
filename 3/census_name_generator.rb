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

$csv = load_csv('columndatatest.csv')

def create_column_types
column_types = {}
	
	$csv.each do |row|
	puts column_types[row[:column_id]] = 
	row[:column_id],
	row[:column_title],
	row[:parent_column_id]
	end

end

create_column_types


