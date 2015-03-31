source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use mysql2 as the database for Active Record
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Don't even know why this is needed but it is...
gem 'globalid', '~> 0.3.3'
gem 'react-rails', github: 'reactjs/react-rails'

# User authentication
gem 'devise', '~> 3.4.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 3.5.1'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3.3'

  # Better alternative to the standard rails testing suite
  gem 'rspec-rails', '~> 3.2.0'
  # Test double package for ruby
  gem 'mocha', '~> 1.1.0'
  # provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.
  gem 'factory_girl', '~> 4.5.0'

  # Generates fake data for tests
  gem 'faker', '~> 1.4.3'

  # For cleaning out the database
  gem 'database_cleaner', '~> 1.4.0'
end

group :test do
  # For if you choose to run your tests using an in-memory database.
  # You may or may not use this but doesn't hurt to have it here.
  gem 'sqlite3', '~> 1.3.10'
  # Needed to make sqlite in-memory work smoothly
  gem 'memory_test_fix', '~> 1.2.2'
end

