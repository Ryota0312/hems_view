require 'date'
require 'net/https'
require 'uri'
require 'open-uri'
require 'json'

base_url = 'https://api.frameworxopendata.jp/api/v3/files/hems/'
APIkey = 'ba91cbaa0e9767a28be082815a8b28c28c8fa5620dce944a262584fa440d954c'
start_date = DateTime.new(2016, 4, 4)
end_date = DateTime.new(2016, 4, 7)
for date in start_date..end_date
  url = "#{base_url}#{date.strftime("%Y%m%d")}.json?acl:consumerKey=#{APIkey}"
  
  res = JSON.parse(open(url).read)
  puts "Get json(#{date})"
  
  for data in res
    id = data["frameworx:hemsId"]
    house = House.where("hems_id is ?", id).first
    if house == nil
      house = House.create(hems_id: id, postal: data["frameworx:postal"])
    end
    house.mains.create(value: data["frameworx:main"], timestamp: data["frameworx:date"])
    house.solar_generates.create(value: data["frameworx:solarGenerated"], timestamp: data["frameworx:date"])
    house.solar_sells.create(value: data["frameworx:solarSold"], timestamp: data["frameworx:date"])
    house.battery_charges.create(value: data["frameworx:batteryCharge"], timestamp: data["frameworx:date"])
    house.battery_discharges.create(value: data["frameworx:batteryDischarge"], timestamp: data["frameworx:date"])
    house.fuel_cells.create(value: data["frameworx:fuelCell"], timestamp: data["frameworx:date"])
    house.gus.create(value: data["frameworx:gusUsage"], timestamp: data["frameworx:date"])
    house.waters.create(value: data["frameworx:waterUsage"], timestamp: data["frameworx:date"])
    puts "#{id}(#{data[frameworx:date]}) is ok."
  end
  puts "#{date} is completed."
end
