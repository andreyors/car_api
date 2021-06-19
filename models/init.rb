# frozen_string_literal: true

require 'data_mapper'
require 'dm-migrations'
require 'dm-ar-finders'

require 'dotenv'
Dotenv.load(File.dirname(File.dirname(__FILE__)) + '.env')

raise 'Please define env variable DB_DSN as it described in README.md' if ENV['DB_DSN'].nil?

DataMapper.setup(:default, ENV['DB_DSN'])

require_relative 'car'
require_relative 'geopoint'

DataMapper.finalize.auto_upgrade!
