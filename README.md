Rails-starter (React)
=========
<img src="https://travis-ci.org/chiedojohn/rails-starter.svg?branch=react" />

A framework for a new rails 4.2.0/ruby 2.2 project for setting up the development environment.

##Local Setup
- Make sure you have an environment variable set up on your host machine which sets RAILS_ENV to development.
- Create an .env file with the following contents within your application directory (Update the port, username and password in accordance with your local database setup)

        ```
        #MYSQL
        MYSQL_DATABASE=YOURAPPNAME_development
        MYSQL_USER=root
        MYSQL_PASS=root
        MYSQL_HOSTNAME=127.0.0.1
        MYSQL_PORT=8889
        SECRET_KEY_BASE=MAKE_SOMETHING_UP
        ```

Add the the following in ~/.bundle/config to make bundler install gems into the app directory under vendor/bundle directory:

```
BUNDLE_PATH: 'vendor/bundle'
```

Be sure to include 'bundle exec' before any rails commands, etc.

##Development Environment
To get started you can build on top of this project or remove all the rails related files and the following:

```
bundle exec rails new .
```

Be sure to add a blank Gemfile.lock if one is not present after running the above.

Be sure to run bundle exec rake db:create as well as your migrations

##When running rails
You will need to run the following to make sure the rails app is accessible outside of the vm or container.

`bundle exec rails s -b 0.0.0.0`

##Testing
- See https://github.com/rspec/rspec-rails for the basics.

React
-----------
All routes not explicitly granted to rails in config/routes.rb will be granted to the ReactJS router. Some predefined routes are as follows:
- /api/cars
- /car
- /bus
