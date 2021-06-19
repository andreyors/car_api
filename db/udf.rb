# frozen_string_literal: true

require_relative '../models/init'

puts 'Inject cube extension'
DataMapper.repository(:default).adapter.execute('CREATE EXTENSION IF NOT EXISTS cube;')

puts 'Inject earthdistance extension'
DataMapper.repository(:default).adapter.execute('CREATE EXTENSION IF NOT EXISTS earthdistance;')
