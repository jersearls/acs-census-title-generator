require 'json'

my_file = File.read('county.json')

my_hash = begin
  JSON.parse(my_file)
rescue JSON::ParserError
end
