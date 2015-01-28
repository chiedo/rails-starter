Rails-vagrant-starter
=========
A vagrant environment for starting rails projects.

READ THIS FIRST (DO NOT IGNORE): https://gist.github.com/chiedojohn/c3e37041b829f28c0c78
----------

Local Development Environment
----------
- Once inside your vagrant virtual machine, navigate to /vagrant and you are ready to start your rails app by running the following:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -L https://get.rvm.io | bash -s stable --ruby
source "/home/vagrant/.rvm/scripts/rvm"
rvm install 2.1
rvm use 2.1 --default
cd /vagrant
sudo gem install bundler
sudo gem install rails
rails new .
sudo gem install rails
rails new .
```
