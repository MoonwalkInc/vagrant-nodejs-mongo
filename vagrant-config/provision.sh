# Update packages
sudo apt-get update

# Install Node.js and NPM
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# Intall Nginx
sudo apt-get -y install nginx

# Install npm@5.7.1
# Temporary fix for issue: https://github.com/npm/npm/issues/20605
sudo npm install -g npm@5.7.1

codename=$(lsb_release -s -c)
if [ $codename == "artful" ] || [ $codename == "bionic" ]; then codename="xenial"; fi

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo 'deb https://repo.mongodb.org/apt/ubuntu '$codename'/mongodb-org/3.6 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org

chown -R vagrant:vagrant /home/vagrant/

# Start and enable the Mongo service so that it automatically starts every time you start the machine
sudo systemctl enable mongod
sudo systemctl start mongod
sudo systemctl status mongod

ln -sf /vagrant/vagrant-config/systemd-scripts/moonwalk_api.service /etc/systemd/system/moonwalk_api.service
sudo systemctl daemon-reload
sudo systemctl enable moonwalk_api.service
sudo systemctl start moonwalk_api.service

#start nginx service
sudo service nginx restart
