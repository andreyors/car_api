require 'rubygems'

require 'logger'
use Rack::Deflater

require 'dotenv'
Dotenv.load '../.env'

require File.join(File.dirname(__FILE__), 'app')
run AllyApp.new