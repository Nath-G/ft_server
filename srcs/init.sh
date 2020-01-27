service mysql start

#Config access
chown -R www-data /usr/share/nginx/html/
chmod -R 755 /usr/share/nginx/html/

#configMysql
echo "CREATE DATABASE wordpress_bdd;" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'mypassword';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/theSiteIwant.pem -keyout /etc/nginx/ssl/theSiteIwant.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=theSiteIwant"

#injecter les table importee en BD 
mysql -u root --skip-password wordpress_bdd < /usr/share/nginx/html/wordpress/wordpress_bdd.sql

#clean up
rm phpMyAdmin-5.0.1-all-languages.tar.gz
rm /usr/share/nginx/html/index.html

service nginx start
service php7.3-fpm start
bash