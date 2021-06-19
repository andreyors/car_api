# frozen_string_literal: true

require 'test/unit'

require File.dirname(File.dirname(__FILE__)) + '/models/init'

class GeoPointTest < Test::Unit::TestCase
  def test_should_return_error_for_wrong_latitude
    geoPoint = GeoPoint.new(100, 0)
    assert_false geoPoint.valid?
  end

  def test_should_return_error_for_wrong_longitude
    geoPoint = GeoPoint.new(0, 200)
    assert_false geoPoint.valid?
  end

  def test_should_return_error_for_wrong_latitude_and_longitude
    geoPoint = GeoPoint.new(100, 200)
    assert_false geoPoint.valid?
  end

  def test_should_return_ok
    geoPoint = GeoPoint.new(0, 0)
    assert geoPoint.valid?
  end
end
