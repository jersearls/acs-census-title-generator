module Tally
  SUBSTITUTIONS = {
    "total" => "tot",
    "including" => "incl",
    "population" => "pop"
  }
  class Abbreviate
    def initialize
      @substitutions = SUBSTITUTIONS
    end

    def call(s)
      s.split('_').map do |word|
        @substitutions[word] || word
      end.join('_')
    end
  end
end
