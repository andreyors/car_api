class GeoPoint
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude.to_i
    @longitude = longitude.to_i
  end

  def valid?
    @latitude.between?(-90, 90) && @longitude.between?(-180, 180)
  end
end