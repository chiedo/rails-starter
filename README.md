Rails-vagrant-starter
=========
A vagrant environment for starting rails projects. (EXPERIMENTAL)


> Requirements: Vagrant and Virtual Box

> It will be assumed that you are familiar with vagrant.

> ####Local Mysql port: 5433

> ####Local http port: 3001

> ####Mysql username: root

> ####Mysql password: root

> ####Existing databases: rails_app_development, rails_app_test, rails_app_production


- Once inside your vagrant virtual machine, navigate to /vagrant and you are ready to start your rails app by running the following:
```
gem install rails
rails new .
```
###Notes:
>* If you have an issue with mysql not connecting, you may need to restart mysql by running 'sudo service mysql restart'
>* Be sure to delete the .git folder after cloning this repo if you intend to use it for a completely unrelated project.
>* If you have issue connecting to mysql via port 5433, then go through an ssh tunnel using (ssh-username 'vagrant', ssh-password 'vagrant', port '2222' then the mysql credentials above except with the standard port of 3306)

###Notes for elastic beanstalk users:
>* Install Elastic Beanstalk command line tools. If using a mac, you can use homebrew and use the following:
```
brew install aws-elasticbeanstalk
```
>* Before you can push to Elastic Beanstalk for the first time, you will need to navigate to your git repo on your local machine then run the following
```
eb init
```
>* It is recommended that after you run 'eb init', you update the path to your AWS credential file as found in /.elasticbeanstalk/config to /usr/local/AWS/.elasticbeanstalk/ENVIRONMENTNAME_credentials being sure to move the original file to the new path. You will likely have to create that path. This will prevent collisions when you have multiple projects using Elastic Beanstalk on one machine.
>* Currently, this is not Elastic Beanstalk Ready. Need to create a base rails app and add the necessary configs and be sure to get the rails app hosted in the root directory.
