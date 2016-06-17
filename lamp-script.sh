# Instructions to use the script
# chmod +x lamp-script.sh
echo "The script is intended to install LAMP stack on Ubuntu 16.04"
echo "The script uses superuser permission"
echo "######################################"
echo "Script starting... It takes some time"
echo "######################################"


#update the repositories
echo "Updating packages repository"
sudo apt-get -y update

###### Apache ######
echo "Installing Apache"
sudo apt-get -y install apache2

echo "Making sure that the UFW firewall allows HTTPS and HTTPS traffic, First checking for a Apache application profile"
sudo ufw app list

echo "Now checking for thepache Full profile"
sudo ufw app info "Apache Full"

# Now getting public IP adress
echo "Use any address below to check Apache welcome page"
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

###### MySQL ######
echo "Installing MYSQL, press Y if not sure of the options"
sudo apt-get -y install mysql-server
sudo mysql_secure_installation

###### PHP ######
echo "Installing PHP"
sudo apt-get -y install php libapache2-mod-php php-mcrypt php-mysql php-curl php-cli php-dev mysql-client phpenmod mcrypt

# Restart apache
echo "Restarting Apache"
sudo systemctl restart apache2
echo "Checking Apache status"
sudo systemctl status apache2

#restrating mysql 
sudo service mysql restart

#pasting the public address
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

##########################
#End of script
echo "------------------ End of Script -----------"
##########################

