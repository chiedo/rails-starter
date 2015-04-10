Rails-starter
=========
<img src="https://travis-ci.org/chiedojohn/rails-starter.svg?branch=master" />

A framework for a new rails 4.2.0/ruby 2.2 project utilizing vagrant or docker 1.5.0 for setting up the development environment.
You are welcome to not use Docker or Vagrant and just run everything locally but handling the configurations for your local development environment will be up to you.

Platform Specific Notes
====================
Docker Notes
--------------
First read: https://gist.github.com/chiedojohn/e7ece910ef4a7e3ce125

You will need to set up a file by the name of .env in the root of your project to store private environments that should not be committed to the git repository. It should have the following contents that you can customize if needed.
```
#RAILS
RAILS_ENV=development
#MYSQL
MYSQL_DATABASE=app_development
MYSQL_USER=admin
MYSQL_PASS=admin
# This is using the docker link
MYSQL_HOSTNAME=db
MYSQL_PORT=3306
```

If you have issues with Gems when attempting to run your app, remove the Gemfile.lock file and then re-run the bundle install and bundle update

Vagrant Notes
----------------
First read: https://gist.github.com/chiedojohn/c3e37041b829f28c0c78

- Once inside your vagrant virtual machine, navigate to /vagrant and you are ready to start your rails app by running the following:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --ruby=2.2
source "/home/vagrant/.rvm/scripts/rvm"
rvm use 2.1 --default
cd /vagrant
gem install bundler
gem install rails --no-ri --no-rdoc
```

Without Docker on Vagrant
--------------------
You will need to set up a database server, then also will need to set up any your .env file as described in Docker notes except with your local database information. Be sure to make the database name unique. You will need to set up the 'dotenv' gem. Also put the following in ~/.bundle/.config to make bundler install into the local directory always:

```
BUNDLE_PATH: 'vendor/bundle'
```

Note that with this approach, you will need to make sure you use 'bundle exec' before any rails commands, etc.

Local Development Environment
----------
To get started you can build on top of this project or remove all the rails related files and the following:

```
rails new .
```

Be sure to add a blank Gemfile.lock if one is not present after running the above.

Be sure to run rake db:create as well as your migrations

When running rails
-----------
You will need to run the following to make sure the rails app is accessible outside of the vm or container.

```rails s -b 0.0.0.0```

Testing
-----------
- See https://github.com/rspec/rspec-rails for the basics.

Reactjs
-----------
- See react/README.md
