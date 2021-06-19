# frozen_string_literal: true

get '/cars' do
  content_type :json

  # Service error in case of wrong location
  code = 500

  latitude = longitude = cars = nil

  location = params[:location]

  # Bad request for skipped location
  halt 400 if location.nil?

  latitude, longitude = location.split(',') if location =~ /,/

  geoPoint = GeoPoint.new(latitude, longitude)
  if geoPoint.valid?
    cars = Car.fetchByGeoPoint(geoPoint)
    code = 200
  end

  status code
  { cars: cars }.to_json
end
