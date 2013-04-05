# Start recording test coverage
require 'simplecov'
SimpleCov.start do
  add_filter "spec"
end

require 'fieldable_form'

# Load test related gem
require 'rspec/autorun'
require 'factory_girl'
require 'faker'
require 'support/matchers/include_validator'

FactoryGirl.find_definitions

# Load migration
ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))
Dir[File.join(ROOT, 'db', 'migrate', '*.rb')].each { |f| require f }

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

# Migrate without showing message
CreateFieldableFormFields.verbose = false
CreateFieldableFormFields.new.change

RSpec.configure do |config|
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
end
