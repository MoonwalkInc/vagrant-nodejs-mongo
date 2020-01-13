
while true
do
  [ -f /vagrant/Vagrantfile ] && break
  sleep 0.1
done
rm -f /etc/nginx/nginx.conf
cp -f /vagrant/vagrant-config/nginx.conf /etc/nginx/nginx.conf
rm -f /etc/mongod.conf
cp -f /vagrant/vagrant-config/mongo-config/mongod.conf /etc/mongod.conf
sudo service nginx restart
sudo service mongod restart

sudo systemctl status nginx.service
sudo systemctl status mongod

sudo systemctl stop moonwalk_api.service
sudo systemctl start moonwalk_api.service
