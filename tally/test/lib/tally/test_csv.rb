require "test_helper"

require "tally/csv"

class TestCsv < TallyTest
  def test_reading_csv_headers
    csv_file = temp_file_for("nonsense.csv", "foo,bar\n84,42")

    result = Tally::Csv.headers(csv_file)

    assert_equal ["foo", "bar"], result
  end
end

