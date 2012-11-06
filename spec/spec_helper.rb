ENV['RACK_ENV'] ||= 'test'

require './config/environment'
require 'rack/test'
require 'database_cleaner'

RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner.clean
  end
end