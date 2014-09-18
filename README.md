Rails-vagrant-starter
=========
A vagrant environment for starting rails projects.


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
rails new app_name
```
###Notes:
>* If you have an issue with mysql not connecting, you may need to restart mysql by running 'sudo service mysql restart'
>* Be sure to delete the .git folder after cloning this repo if you intend to use it for a completely unrelated project.

###Notes for elastic beanstalk users:
>* You should do all of your elastic beanstalk interaction via the vagrant VM. You should only need to run 'eb init' if you are the first person who hooks up the repository to Elastic Beanstalk. After you do this, make sure .elasticbeanstalk/ and .ebextensions/ ARE NOT in .gitignore.
>* Everyone who intends to push changes to Elastic Beanstalk will need to set up their AWS credential file at '/home/vagrant/.elasticbeanstalk/aws_credential_file'.
