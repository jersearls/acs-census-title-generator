require "tally/csv"
require "tally/abbreviate"

module Tally
  def self.table_create_script_from_sequence_csv(file_path)
    sequence_number = sequence_number_for(file_path)
    <<-SQL.gsub(/^\s+/, '')
      CREATE EXTERNAL TABLE 2014_5_year_acs_sequence_#{sequence_number}(
        #{column_statements_for(file_path)}
      )
      ROW FORMAT DELIMITED
      FIELDS TERMINATED BY ','
      LOCATION '/projects/census/#{sequence_number}'
      tblproperties ("skip.header.line.count"="1");
    SQL
  end

  def self.abbreviate(s)
    @abbreviate ||= Abbreviate.new
    @abbreviate.call(s)
  end

private

  def self.column_statements_for(file_path)
    Csv.headers(file_path).map {|h| "#{h} string" }.join(",\n")
  end

  def self.sequence_number_for(file_path)
    if match = file_path.match(/.*\/\w+(\d\d\d\d)\w+.csv/)
      match[1].to_i
    else
      raise "Unexpected File Path, can't determine sequence number from: '#{file_path}'"
    end
  end
end
