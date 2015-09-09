class Car
  include DataMapper::Resource

  CAR_MAX_ITEMS = 10

  property :id, Serial, :key => true
  property :description, String, :length => 255, :required => true
  property :latitude, Float, :required => true
  property :longitude, Float, :required => true

  def self.fetchByGeoPoint(geoPoint, limit = self::CAR_MAX_ITEMS)
    if geoPoint.is_a?(GeoPoint)
      sql = 'SELECT *
        FROM cars
        ORDER BY (point(longitude, latitude) <@> point(%f, %f)), id
        LIMIT %d'
      Car.find_by_sql([sql % [geoPoint.longitude, geoPoint.latitude, limit]])
    end
  end

  def as_json(options={})
    super(options.merge(only: [:description, :latitude, :longitude]))
  end

end