Rails-vagrant-starter
=========
<img src="https://travis-ci.org/chiedojohn/rails-starter.svg?branch=master" />

READ THIS FIRST (DO NOT IGNORE): https://gist.github.com/chiedojohn/c3e37041b829f28c0c78
----------

Notes
----------
> You will see an app by the name of "example-app" within the base directory. This app will contain some basic examples of how to structure your tests, set up different areas of your project, etc. Do not use that to build your rails app. Just reference that code if needed. You may even just want to copy that app to your desktop somewhere and delete it from the git repo. Obviously, when you navigate into the example-app directory, you will need to run ```bundle install```
> Due to the sluggishness of ruby this whole process of setting up your VM will take about 30 minutes.
Local Development Environment
----------
- Once inside your vagrant virtual machine, navigate to /vagrant and you are ready to start your rails app by running the following:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --ruby=2.2
source "/home/vagrant/.rvm/scripts/rvm"
rvm use 2.1 --default
cd /vagrant
gem install bundler
gem install rails --no-ri --no-rdoc
rails new .
```

When running rails
-----------
You will need to run "rails s -b 0.0.0.0" to make sure the rails app is accessible outside of Vagrant

Testing
-----------
- See https://github.com/rspec/rspec-rails for the basics.
