# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/06 11:22:31 by nagresel          #+#    #+#              #
#    Updated: 2020/01/22 10:37:48 by nagresel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#http://localhost/phpmyadmin/index.php
#*.local, 169.254/16
from debian:buster

run apt-get update
run apt-get upgrade

#server install 
run apt-get -y install nginx

#utils install
run apt-get -y install procps
run apt-get -y install nano
run apt-get -y install wget


#services install
run apt-get -y install mariadb-server mariadb-client
run apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
run apt install -y php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi
#run apt-get -y install php-{mbstring,zip,gd,xml,pear,gettext,cgi}


run wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
run mkdir /usr/share/nginx/html/phpmyadmin && tar xzf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1 -C /usr/share/nginx/html/phpmyadmin
run wget http://fr.wordpress.org/latest-fr_FR.tar.gz
run mkdir /usr/share/nginx/html/wordpress && tar xzf latest-fr_FR.tar.gz --strip-components=1 -C /usr/share/nginx/html/wordpress
run mkdir /etc/nginx/ssl

#delete conf default file
run rm /etc/nginx/sites-enabled/default

#Files required
copy ./srcs/init.sh .
copy ./srcs/nginx.conf /etc/nginx/sites-available/localhost
copy ./srcs/config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
#copy ./srcs/config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
copy ./srcs/index.html /usr/share/nginx/html/index.html
copy ./srcs/wp-config.php /usr/share/nginx/html/wordpress/wp-config.php

#link creation
run ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
#1 seule cmd autorisee au lancement de l'installation init.sh est le script de lancement une fois le conteneur lance
#copy && dizip


#script
cmd bash init.sh
#CMD /usr/bin/nginx -g "daemon off;"


#theSiteIwant

    # Creation du site disponible pour nginx
  #  run mkdir /etc/nginx/sites-available/theSiteIwant

    # Creation du dossier de donnees du site
   # run mkdir /sites
    #run mkdir /sites/theSiteIwant.com
    #run mkdir /sites/theSiteIwant.com/html
    #run cd /sites/theSiteIwant.com/html && mkdir tmp

    # Installation de PHPMyAdmin
   # run cd /sites/theSiteIwant.com/html/tmp && wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
    #run cd /sites/theSiteIwant.com/html && mkdir phpmyadmin
    #run cd /sites/theSiteIwant.com/html/phpmyadmin && tar xzf ../tmp/phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1

    # Copie des fichiers config server
    #copy ./srcs/init.sh .
    #copy ./srcs/nginx.conf /etc/nginx/sites-available/theSiteIwant
    #copy ./srcs/config.inc.php /etc/nginx/sites-available/theSiteIwant/phpmyadmin/config.inc.php

    # Copie fichiers index general

    # Clean
    #run rm -fr /sites/theSiteIwant.com/html/tmp

    # Lancement
    #run ln -s /etc/nginx/sites-available/theSiteIwant /etc/nginx/sites-enabled/theSiteIwant
    #run sh init.sh
