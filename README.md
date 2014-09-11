Local Development Environment
- Requirements: Vagrant and Virtual Box
- Run 'vagrant up' whenever you want to launch the environment.
- Run 'vagrant halt' to shut down the environment.
- Run 'vagrant destrop' to completely destroy the environment. Your application will still remain.
- Run 'vagrant ssh' to connect to the virtual machine hosting your development environment. Within the virtual machine. Your application can be found at /vagrant. You can either do git pushes and pulls from within the virtual machine or from your local machine within your app. Both vagrant and your local machine share the application folder even though they use different file paths.
-- You can access your vagrant virtual machine's rails app (when you have started it within the rails app in your vagrant virtual machine) at port at local host 3001 in your browser and can access your vagrant virtual machine's mysql server at port 5433 at localhost. 
-- Your mysql credentials will be username: root, password: root. Their will be three databases set up, rails_app_test, rails_app_development and rails_app_production.
- You will need to update the config/database.yml file from within your app.
- You will need to download a live copy of the database to start and import it into the railsapp_development database if a sample data set by the name of 'data/initial.sql' is not provided.
