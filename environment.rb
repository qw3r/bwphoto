require 'rubygems'
require 'bundler/setup'

Bundler.setup :default, (ENV['RACK_ENV'] || 'development')

require 'rack'
require 'grape'
require 'mongoid'

require './model'
require './api'

Mongoid.load!('./mongoid.yml')
# Mongoid.logger = Moped.logger = Logger.new(STDOUT)

