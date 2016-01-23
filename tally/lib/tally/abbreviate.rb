module Tally
  SUBSTITUTIONS = {
    "total" => "tot",
    "including" => "incl",
    "population" => "pop"
  }
  def self.abbreviate(s)
    s.split('_').map do |word|
      SUBSTITUTIONS[word] || word
    end.join('_')
  end
end
