service mysql start

#configMysql
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
#import create_tables.sql
#mkdir /var/www/theSiteIwant/phpmyadmin/tmp && touch /var/www/theSiteIwant/phpmyadmin/index.php
#echo "<?php phpinfo(); ?>" >> /var/www/theSiteIwant/phpmyadmin/index.php
#echo "mysql < /var/www/theSiteIwant/phpmyadmin/sql/create_tables.sql -u root -p --skip-password"
#echo "mysql -u root -p --skip-password"
#GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';
#FLUSH PRIVILEGES;
#EXIT;
#mkdir /var/www/theSiteIwant/phpmyadmin/tmp
#chmod 777 /var/www/theSiteIwant/phpmyadmin/tmp
#chown -R www-data:www-data /var/www/theSiteIwant/phpmyadmin

service nginx start
service php7.3-fpm start
bash
#service php7.3-fpm start
#/usr/bin/nginx -g "daemon off;"