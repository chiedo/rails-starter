ENV["RAILS_ENV"] = 'test'
require "devise"

RSpec.configure do |config|
  # The following two are needed for devise
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_framework = :mocha

  config.before :all do
    FactoryGirl.reload
  end

  # Database cleaner: to ensure that the test database is cleaned after each test.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
