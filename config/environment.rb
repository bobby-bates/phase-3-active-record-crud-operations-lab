ENV["RACK_ENV"] ||= "development"

require 'pry'
require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])

require_all 'app/models'
