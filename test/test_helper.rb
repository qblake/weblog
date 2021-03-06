ENV["RAILS_ENV"] ||= "test"

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong/adapters/minitest'

require 'bundler/setup'

FactoryGirl.reload

# require 'coveralls'
# Coveralls.wear!

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end
