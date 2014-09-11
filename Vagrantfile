VAGRANTFILE_API_VERSION = "2"

# These are the scripts that will be run by the terminal upon creation of a new machine.
$script = <<SCRIPT
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get update
sudo apt-get -y install mysql-server-5.5
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y ruby-dev
sudo apt-get install -y make
sudo update-rc.d mysql defaults
\curl -sSL https://get.rvm.io | bash -s stable
\curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
rvm install 2.1
rvm use 2.1 --default
source /home/vagrant/.bashrc
cd /vagrant
su - vagrant -c 'sudo gem install bundler'
su - vagrant -c 'sudo gem install rails'
su - vagrant -c 'sudo bundle install'
su - vagrant -c 'sudo bundle update'
cd

if [ ! -f /var/log/databasesetup ];
then
    echo "CREATE DATABASE rails_app_test" | mysql -uroot -proot
    echo "CREATE DATABASE rails_app_development" | mysql -uroot -proot
    echo "CREATE DATABASE rails_app_production" | mysql -uroot -proot

    echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" | mysql -uroot -proot
    #make mysql listen to connections from the outside
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -uroot -proot
    echo "FLUSH PRIVILEGES;" | mysql -uroot -proot
    sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
    sudo service mysql restart

    touch /var/log/databasesetup

    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -proot rails_app_development < /vagrant/data/initial.sql
    fi
fi

# This sets up dev environment variables
if [ ! -f /var/log/devenv ];
then
  cd
  echo 'export RAILS_ENV="development"' | sudo tee -a /home/vagrant/.bashrc
  touch /var/log/devenv
fi


SCRIPT


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # forward the python runserver port
  config.vm.network "forwarded_port", guest: 3000, host: 3001
  # forward mysql
  config.vm.network "forwarded_port", guest: 3306, host: 5433

  # run the script from above
  config.vm.provision "shell", inline: $script
  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=777,fmode=666']
end
