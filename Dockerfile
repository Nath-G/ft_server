# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/06 11:22:31 by nagresel          #+#    #+#              #
#    Updated: 2020/01/08 17:25:12 by nagresel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from debian:buster
run apt-get update
run apt-get upgrade

#server install 
run apt-get -y install nginx

#utils install
run apt-get -y install nano
run apt-get -y install wget
#run apt-get -y install procps
#for wordpress LEMP stack is required
#run apt-get install cmake libncursesw5-dev libncurses5-dev cmake build-essential libssl-dev pkg-config

#services install
run apt-get -y install mariadb-server mariadb-client
run apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
run apt install -y php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi 
#run apt-get -y install php-{mbstring,zip,gd,xml,pear,gettext,cgi}
run wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
run mkdir /var/www/html/phpmyadmin && tar xzf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
run cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
#run tar xvf phpMyAdmin-5.0.1-all-languages.tar.gz 
#run mv phpMyAdmin-4.9.0.1-all-languages/ /usr/share/phpmyadmin
#run mysql_secure_installation

#delete conf default file
run rm /etc/nginx/sites-enabled/default

#Files required
copy ./srcs/init.sh .
copy ./srcs/nginx.conf /etc/nginx/sites-available/localhost

#link creation
run ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
#1 seule cmd autorisee au lancement de l'installation init.sh est le script de lancement une fois le conteneur lance
#https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz

#script
cmd bash init.sh
#CMD /usr/bin/nginx -g "daemon off;"
