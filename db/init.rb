require 'json'

require File.dirname(File.dirname(__FILE__)) + '/models/init'

DataMapper.repository(:default).adapter.execute('DROP TABLE "cars";') if DataMapper.repository(:default).adapter.storage_exists?('cars')
DataMapper.repository(:default).adapter.execute('CREATE TABLE "cars" (id SERIAL, description VARCHAR(255), latitude FLOAT, longitude FLOAT);')

filename = File.expand_path(File.dirname(__FILE__) + "/data.json")
if (File.exist? filename)
  puts 'Parsing JSON data'
  lines = JSON.parse(IO.read(filename))

  puts 'Importing...'
  lines['locations'].each do |row|
    cnt = row['vehicleCount'].to_i
    (1..cnt).each do
      Car.create!(description: row['description'], latitude: row['latitude'].to_f, longitude: row['longitude'].to_f)
    end
  end

  puts '%d items inserted' % Car.all().count()
end
