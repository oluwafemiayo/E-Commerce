#1. download the FleetCart zip from s3 to the html derectory on the ec2 instance
sudo aws s3 sync s3://sixwins-fleetcart-web-files /var/www/html


#2. unzip the FleetCart zip folder
cd /var/www/html
sudo unzip FleetCart.zip


#3. move all the files and folder from the FleetCart directory to the html directory
sudo mv FleetCart/* /var/www/html


#4. move all the hidden files from the FleetCart diretory to the html directory
sudo mv FleetCart/.DS_Store /var/www/html
sudo mv FleetCart/.editorconfig /var/www/html
sudo mv FleetCart/.env /var/www/html
sudo mv FleetCart/.env.example /var/www/html
sudo mv FleetCart/.eslintignore /var/www/html
sudo mv FleetCart/.eslintrc /var/www/html
sudo mv FleetCart/.gitignore /var/www/html
sudo mv FleetCart/.htaccess /var/www/html
sudo mv FleetCart/.npmrc /var/www/html
sudo mv FleetCart/.php_cs /var/www/html
sudo mv FleetCart/.rtlcssrc /var/www/html


#5. delete the FleetCart and FleetCart.zip folder
sudo rm -rf FleetCart FleetCart.zip


#6. enable mod_rewrite on ec2 linux, add apache to group, and restart server
sudo sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
chown apache:apache -R /var/www/html 
sudo service httpd restart
