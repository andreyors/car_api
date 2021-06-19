# frozen_string_literal: true

require 'test/unit'

require File.dirname(File.dirname(__FILE__)) + '/models/init'

class GeoPointTest < Test::Unit::TestCase
  def test_should_return_error_for_wrong_latitude
    geo_point = GeoPoint.new(100, 0)
    assert_false geo_point.valid?
  end

  def test_should_return_error_for_wrong_longitude
    geo_point = GeoPoint.new(0, 200)
    assert_false geo_point.valid?
  end

  def test_should_return_error_for_wrong_latitude_and_longitude
    geo_point = GeoPoint.new(100, 200)
    assert_false geo_point.valid?
  end

  def test_should_return_ok
    geo_point = GeoPoint.new(0, 0)
    assert geo_point.valid?
  end
end
