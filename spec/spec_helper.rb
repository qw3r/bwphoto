ENV['RACK_ENV'] ||= 'test'

require './environment'
require 'rack/test'
require 'database_cleaner'

RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner.clean
  end
end