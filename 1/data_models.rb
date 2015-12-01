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
      model_from_row(row)
    end
  end

private

  def model_from_row(row)
    @model_class.new.tap do |model|
      row.headers.each do |attr|
        model.send("#{attr}=", row[attr])
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
      state = path.match(/#{@directory}\/(.*)\.csv/)[1].upcase
      CreatesModelsFromCsv.new(path, CountySTD).create.tap do |models|
        models.each { |m| m.state = state }
      end
    end.flatten
  end
end

class CountySTD
  attr_accessor :state, :year, :geography,
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
