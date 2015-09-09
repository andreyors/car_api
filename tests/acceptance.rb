ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'

require File.expand_path '../../app.rb', __FILE__

class CarApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app()
    AllyApp
  end

  def test_should_return_code_400_without_location
    get '/cars'
    assert last_response.status === 400
  end

  def test_should_return_code_400_with_empty_location
    get '/cars?location'
    assert last_response.status === 400
  end

  def test_should_return_code_500_with_wrong_latitude
    get '/cars?location=100,0'
    assert last_response.status === 500
  end

  def test_should_return_code_500_with_wrong_longitude
    get '/cars?location=0,200'
    assert last_response.status === 500
    end

  def test_should_return_code_500_with_wrong_latitude_and_longitude
    get '/cars?location=100,200'
    assert last_response.status === 500
  end

  def test_should_return_valid_response
    get '/cars?location=0,0'
    assert last_response.ok?
  end

  def test_should_return_ten_items
    get '/cars?location=0,0'
    assert JSON.parse(last_response.body)['cars'].count() === 10
  end

end
