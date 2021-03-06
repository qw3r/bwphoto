require 'rubygems'
require 'bundler/setup'

Bundler.setup :default, (ENV['RACK_ENV'] || 'development')

require 'rack'
require 'grape'
require 'mongoid'
require 'carrierwave'
require 'carrierwave/mongoid'

Dir['./{uploaders,models,apis}/*'].each { |s| require s }


Mongoid.load! './config/mongoid.yml'
# Mongoid.logger = Logger.new(STDOUT)

#CarrierWave.configure do |config|
#end