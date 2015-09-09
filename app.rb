# encoding: utf-8
require 'json'
require 'sinatra'

class AllyApp < Sinatra::Application

  configure do
    set :root, File.dirname(__FILE__)
  end

end

require_relative 'models/init'
require_relative 'routes/init'