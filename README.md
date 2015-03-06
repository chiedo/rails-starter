Rails-starter
=========
<img src="https://travis-ci.org/chiedojohn/rails-starter.svg?branch=master" />

A framework for a new rails 4.2.0/ruby 2.2 project utilizing vagrant or docker for setting up the development environment.

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
MYSQL_USER=root
MYSQL_PASSWORD=root
# This needs to be set if you are using root as the username
MYSQL_ROOT_PASSWORD=root
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

Local Development Environment
----------
To get started you can build on top of this project or remove all the rails related files and the following:

```
rails new .
```

Be sure to add a blank Gemfile.lock if one is not present after running the above.

When running rails
-----------
You will need to run the following to make sure the rails app is accessible outside of the vm or container.

```rails s -b 0.0.0.0```

Testing
-----------
- See https://github.com/rspec/rspec-rails for the basics.
