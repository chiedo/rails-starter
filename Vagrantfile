VAGRANTFILE_API_VERSION = "2"

# These are the scripts that will be run by the terminal upon creation of a new machine.
$script = <<SCRIPT
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux=1.9a-1~ppa1~t
sudo apt-get install -y mysql-server-5.5
sudo apt-get install -y unzip
sudo apt-get install -y npm nodejs
sudo apt-get remove -y git
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libxslt-dev libxml2-dev
sudo apt-get install -y ruby-dev
sudo apt-get install -y make
sudo apt-get install -y nodejs
sudo update-rc.d mysql defaults
touch ~/.gemrc
sudo touch /root/.gemrc
cd

if [ ! -f /var/log/databasesetup ];
then
    echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" | mysql -uroot -proot
    #make mysql listen to connections from the outside
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -uroot -proot
    echo "FLUSH PRIVILEGES;" | mysql -uroot -proot
    sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
    sudo service mysql restart

    touch /var/log/databasesetup

    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -proot app_development < /vagrant/data/initial.sql
    fi
fi

# This sets up dev environment variables
if [ ! -f /var/log/devenv ];
then
  cd
  #RAILS
  echo 'export RAILS_ENV="development"' | sudo tee -a /home/vagrant/.bashrc
  echo 'gem: --no-rdoc --no-ri' | sudo tee -a /home/vagrant/.gemrc
  echo 'gem: --no-rdoc --no-ri' | sudo tee -a /root/.gemrc
  # MYSQL
  echo 'export MYSQL_DATABASE="app_development"' | sudo tee -a /home/vagrant/.bashrc
  echo 'export MYSQL_USER="root"' | sudo tee -a /home/vagrant/.bashrc
  echo 'export MYSQL_PASS="root"' | sudo tee -a /home/vagrant/.bashrc
  echo 'export MYSQL_HOSTNAME="127.0.0.1"' | sudo tee -a /home/vagrant/.bashrc
  echo 'export MYSQL_PORT="3306"' | sudo tee -a /home/vagrant/.bashrc
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
  #config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=777,fmode=666']
  # Replace the above with this. This should make Vagrant much faster
  # Required for NFS to work, pick any local IP
  config.vm.network :private_network, ip: '192.168.50.140'
  # Use NFS for shared folders for better performance
  config.vm.synced_folder '.', '/vagrant', nfs: true, :mount_options => ['actimeo=2']

  # Sets Vagrant VM to use. 1/4 system memory & access to all cpu cores on the host
  host = RbConfig::CONFIG['host_os']
  if host =~ /darwin/
    cpus = `sysctl -n hw.ncpu`.to_i
    # sysctl returns Bytes and we need to conconfig.rt to MB
    mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
  elsif host =~ /linux/
    cpus = `nproc`.to_i
    # meminfo shows KB and we need to conconfig.rt to MB
    mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
  else # sorry Windows folks, I can't help you
    cpus = 2
    mem = 1024
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
  end
end
