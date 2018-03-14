require 'bundler'

ENV['RACK_ENV'] ||= 'test'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)


require 'rspec'
require 'capybara/dsl'
require 'capybara/rspec'

Capybara.app = LittleShopApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:each) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end

DatabaseCleaner.strategy = :truncation
RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
