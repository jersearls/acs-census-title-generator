require 'json'

county_string = File.read('county.json')

county_hash =  JSON.parse(county_string)

def update_statefp(state_id)
    if state_id == "01"
      state_id =  "Alaska"
  else state_id = state_id
  end
end

county_hash.map { |o| o["properties"]["state_and_county"] = update_statefp(o["properties"]["STATEFP"]) + "-" + o["properties"]["NAME"]}
