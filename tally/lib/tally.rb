require "tally/csv"

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

private

  def self.column_statements_for(file_path)
    Csv.headers(file_path).map {|h| "#{h} string" }.join(",\n")
  end

  def self.sequence_number_for(file_path)
    file_path.match(/.*\/\w\w(\d+)\w\w\.csv/)[1].to_i
  end
end
