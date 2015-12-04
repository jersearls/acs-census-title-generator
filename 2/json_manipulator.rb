require 'json'

county_string = File.read('county.json')

county_hash =  JSON.parse(county_string)

def update_statefp(state_id)
    if state_id == "01"
      state_id = "AL"
  elsif
  state_id == "02"
    state_id = "AK"
  elsif
  state_id == "02"
    state_id = "AK"
  elsif
  state_id == "04"
    state_id = "AZ"
  elsif
  state_id == "05"
    state_id = "AR"
  elsif
  state_id == "06"
    state_id = "CA"
  elsif
  state_id == "08"
    state_id = "CO"
  elsif
  state_id == "09"
    state_id = "CT"
  elsif
  state_id == "10"
    state_id = "DE"
  elsif
  state_id == "11"
    state_id = "DC"
  elsif
  state_id == "12"
    state_id = "FL"
  elsif
  state_id == "13"
    state_id = "GA"
  elsif
  state_id == "15"
    state_id = "HI"
  elsif
  state_id == "16"
    state_id = "ID"
  elsif
  state_id == "17"
    state_id = "IL"
  elsif
  state_id == "18"
    state_id = "IN"
  elsif
  state_id == "19"
    state_id = "IA"
  elsif
  state_id == "20"
    state_id = "KS"
  elsif
  state_id == "21"
    state_id = "KY"
  elsif
  state_id == "22"
    state_id = "LA"
  elsif
  state_id == "23"
    state_id = "ME"
  elsif
  state_id == "24"
    state_id = "MD"
  elsif
  state_id == "25"
    state_id = "MA"
  elsif
  state_id == "MI"
    state_id = "26"
  elsif
  state_id == "27"
    state_id = "MN"
  elsif
  state_id == "28"
    state_id = "MS"
  elsif
  state_id == "29"
    state_id = "MO"
  elsif
  state_id == "30"
    state_id = "MT"
  elsif
  state_id == "31"
    state_id = "NE"
  elsif
  state_id == "32"
    state_id = "NV"
  elsif
  state_id == "33"
    state_id = "NH"
  elsif
  state_id == "34"
    state_id = "NJ"
  elsif
  state_id == "35"
    state_id = "NM"
  elsif
  state_id == "36"
    state_id = "NY"
  elsif
  state_id == "37"
    state_id = "NC"
  elsif
  state_id == "38"
    state_id = "ND"
  elsif
  state_id == "39"
    state_id = "OH"
  elsif
  state_id == "40"
    state_id = "OK"
  elsif
  state_id == "41"
    state_id = "OR"
  elsif
  state_id == "42"
    state_id = "PA"
  elsif
  state_id == "44"
    state_id = "RI"
  elsif
  state_id == "45"
    state_id = "SC"
  elsif
  state_id == "46"
    state_id = "SD"
  elsif
  state_id == "47"
    state_id = "TN"
  elsif
  state_id == "48"
    state_id = "TX"
  elsif
  state_id == "49"
    state_id = "UT"
  elsif
  state_id == "50"
    state_id = "VT"
  elsif
  state_id == "51"
    state_id = "VA"
  elsif
  state_id == "53"
    state_id = "WA"
  elsif
  state_id == "54"
    state_id = "WV"
  elsif
  state_id == "55"
    state_id = "WI"
  elsif
  state_id == "56"
    state_id = "WY"
  else state_id = state_id
  end
end

county_hash.map { |o| o["properties"]["state_and_county"] = update_statefp(o["properties"]["STATEFP"]) + "-" + o["properties"]["NAME"]}
