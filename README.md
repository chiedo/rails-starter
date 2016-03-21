Rails-starter
=========
No longer maintained in favor of <a href="https://github.com/chiedo/rails-api-starter" target="_blank">Rails API Starter</a>

A framework for a new rails 4.2.0/ruby 2.2 project for setting up the development environment.

### Setup

1. Make sure you have an `RAILS_ENV` environment variable set on your machine and have it set to 'development'.

2. Install your packages by running `bundle install`.

3. Make sure you will need to have Mysql installed.

4. Create the database with `bundle exec rake db:create`

5. You can override any environment variables such as the mysql port with a dotenv file if you wish. [Read more](https://github.com/bkeepers/dotenv)

### Development

1. Start your mysql server

2. use `bundle exec rails s` to run the web server.

### Testing:

Tests are written using rspec. You can run tests with the following:

  	bundle exec rspec

  See https://github.com/rspec/rspec-rails for the basics.
