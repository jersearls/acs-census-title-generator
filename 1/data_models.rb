require 'csv'
class CreatesModelsFromCsv
  def initialize(csv_path, model_class)
    @csv_path = csv_path
    @model_class = model_class
  end

  def create
    CSV.foreach(@csv_path,
      headers: true,
      header_converters: ->(header) { header.downcase.gsub(/[\W]+/, '_') }
    ).map do |row|
      @model_class.new.tap do |model|
        puts row.headers
        row.headers.each do |attr|
          model.send("#{attr}=", row[attr])
        end
      end
    end
  end
end

class CreatesCountyStdModels
  def initialize(directory)
    @directory = directory
  end

  def create
    Dir["#{@directory}/*.csv"].map do |path|
      CreatesModelsFromCsv.new(path, CountySTD).create
    end
  end
end

class CountySTD
  attr_accessor :year, :geography,
                :chlamydia_cases, :chlamydia_rate,
                :gonorrhea_cases, :gonorrhea_rate,
                :primary_and_secondary_syphilis_cases, :primary_and_secondary_syphilis_rate
end

class CountyFIPS
  def initialize(state_abrev,state_code,county_code,county_name,county_class)
    # intialize class variables
  end

  # Add any additional class/instance methods here
end

class CountyJoined
  def initialize()
    # intialize class variables
  end

  # Add any additional class/instance methods here
end
