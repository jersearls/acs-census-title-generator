require 'yaml'

module Tally
  class Abbreviate
    def initialize
      @substitutions = YAML.load_file(
        File.join(File.dirname(__FILE__), "../../config/abbreviations.yml")
      )
    end

    def call(s)
      s.split('_').map do |word|
        @substitutions[word] || word
      end.join('_')
    end
  end
end
