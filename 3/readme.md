# Census Column Title Generator

The Census Column Title Generator takes metadata regarding column and table titles from [Census Reporter](https://github.com/censusreporter/census-table-metadata/tree/master/precomputed/acs2014_5yr) and extracts the column and table titles( 'census_column_metadata.csv' and census_table_metadata.csv) creating a logical column title that replaces coded ACS csv data table headers. 

This program allows users to work with the ACS census tables they desire without the need of a lookup table. The Census Column Title Generator has only been tested with 2014 5 year ACS data, but hypothetically will work with any year provided by the Census Reporter that is in the same formatting. 

# Usage/Code Example

The input ACS csv data table with coded headers is specified in driver.rb

```
files = Dir['../data/acs/*.csv']
```

Any file located in the '/acs' folder will be loaded into the program and when complete, an altered copy with titled headers will be added to the '/acs' folder.

The driver calls the csv_header_alteration method located in the csv_generator.rb file. This finds the coded headers and replaces them will full titles, writing them to a new csv file with the original name + "_titled" added to the end of the name. 

The csv_header_alteration method calls a hashed format of the format_estimate_array and format_margin_of_error_array within the title_reformatter.rb file. 

These calls create two hashes, one pertaining to codes that refer to the values containing actual data in the data table, and another hash that relates to the codes that refer to a value representing the margin of error in the actual data.

```
def format_margin_of_error_array
	titles = reformat_titles

	titles.map do |titles| 
		titles[:col_id].insert(-4, 'm')
		titles[:title].insert(0, 'moe_')

	  	if titles[:col_id][-3] == "0" && titles[:col_id][-2] != "0"
	  		titles[:col_id].slice!(-3)
		elsif titles[:col_id][-3] == "0" && titles[:col_id][-2] == "0" 
			titles[:col_id].slice!(-3)
			titles[:col_id].slice!(-2)
		end
	end

	return titles
end
```

The resulting hashes contain column codes as the key, with the full column title as the value. 

The format_array methods in title_reformatter call upon the reformat_titles method located in full_title_generator.rb

The reformat_titles method takes a concatentation of table name and column name string, and creates a snake_cased version.

```
def reformat_titles
	title_info = combine_columns_and_table_names
	column_hash = {}
	title_info.map do |info| 
		column_hash = 
		{title: info[:full_title].downcase.gsub(/total/, "tot").gsub(/including/, "incl")
			.gsub(/population/, "pop").gsub(/years/, "yrs").gsub(/months/, "mos")
			.gsub(/never/, "nvr")
			.gsub(/[^A-Za-z0-9]+/,'_').gsub(/^_/, '').gsub(/_$/, ''), 
			table_id: info[:table_id], col_id: info[:col_id]}
	end
	
end
```


The method reformat_titles in full_title_generator.rb calls a series of methods in full_title_generator.rb that create a hash of table titles and table id codes from 'census_table_metadata.csv' and combine this title with the title created in column_name generator.rb.

```
def combine_columns_and_table_names
	table_names = get_table_info
	columns = create_column_data
	columns.each do |column|
		column[:full_title] = "#{table_names[column[:table_id]]}_#{column[:title]}"
	end
	return columns
end
```

The column_name_generator.rb creates a row of hashes from the 'census_column_metadata.csv' and by creating a hash lookup of the parent column id, the value containing the title is displayed as well as its parent etc. until parent id is nil.

```
def create_column_titles(filename)
column_titles = {}
	
	load_csv(filename).map do |row|
	column_titles[row[:column_id]] =
	row[:column_title],
	column_titles[row[:parent_column_id]]
	end
end

```

The nested series of arrays created by this process are flattened, created one string with a logical name. 

```
def title_processor

    column_titles = create_column_titles('../data/census_column_metadata.csv')

    processed_titles = column_titles.map { |o|
		o.flatten.compact.reverse.join
	}
end
```

Finally, a hash is created that has the newly created title, table id(to allow a hash lookup for table title) and column id as keys. 


