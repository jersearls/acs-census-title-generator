require "csv"

module Tally
  module Csv
    def self.headers(file_path)
      CSV.open(file_path, 'r') { |csv| csv.first }
    end
  end
end
