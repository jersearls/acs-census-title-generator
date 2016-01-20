require "test_helper"

require "tally"

class TestTally < TallyTest
  def test_table_create_script_from_sequence_csv
    csv_file = temp_file_for("sf0013ca.csv", "foo,bar\n84,42")

    result = Tally.table_create_script_from_sequence_csv(csv_file)

    expected = <<-SQL.gsub(/^\s+/, '')
      CREATE EXTERNAL TABLE 2014_5_year_acs_sequence_13(
        foo string,
        bar string
      )
      ROW FORMAT DELIMITED
      FIELDS TERMINATED BY ','
      LOCATION '/projects/census/13'
      tblproperties ("skip.header.line.count"="1");
    SQL
    assert_equal expected, result
  end
end
