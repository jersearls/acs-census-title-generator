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
def create_column_titles(filename)
column_titles = {}
	
	load_csv(filename).map do |row|
	column_titles[row[:column_id]] =
	row[:column_title],
	column_titles[row[:parent_column_id]]
	end

end

def create_column_id(filename)
	
	load_csv(filename).map do |row|
	row[:column_id]
	end

end

def create_table_id(filename)
	load_csv(filename).map do |row|
	row[:table_id]
	end

end

#calls methods with file input & 
#creates an array of titles in logical order with snakecase formatting	

def title_processor

    column_titles = create_column_titles('census_column_metadata.csv')

    processed_titles = column_titles.map { |o|
		o.flatten.compact.reverse.join.downcase.
		gsub(/[^A-Za-z0-9,:]+/,'_').gsub(/^_/, '').gsub(/_$/, '')
	}
end

#creates and array with [title, table_id]
def create_title_and_table_id_array
	table_id = create_table_id('census_column_metadata.csv')
	title_processor.zip(table_id)
end

#creates a hash with key column_id and [title, table_id] array as value
def create_column_id_hash

column_id = create_column_id('census_column_metadata.csv')

hash_w_title_and_table_id = Hash[column_id.zip(create_title_and_table_id_array)]

end

#creates an array of full table titles
def create_table_name(filename)
	load_csv(filename).map do |row|
	row[:table_title]
	end

end

#calls and assigns table_name array
def get_table_name
	table_name = create_table_name('census_table_metadata.csv')
end


hash = create_column_id_hash


binding.pry

#########################
# To do
# Join table names with column titles
#


