# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/06 11:22:31 by nagresel          #+#    #+#              #
#    Updated: 2020/01/27 11:35:39 by nagresel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#http://localhost/phpmyadmin/index.php
#*.local, 169.254/16
FROM debian:buster

RUN apt-get update
RUN apt-get upgrade

#server install 
RUN apt-get -y install nginx

#utils install
RUN apt-get -y install procps
RUN apt-get -y install nano
RUN apt-get -y install wget


#services install
RUN apt-get -y install mariadb-server mariadb-client
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt install -y php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz
RUN mkdir /usr/share/nginx/html/phpmyadmin && tar xzf phpMyAdmin-5.0.1-all-languages.tar.gz --strip-components=1 -C /usr/share/nginx/html/phpmyadmin
RUN mkdir /usr/share/nginx/html/wordpress


#delete conf default file
RUN rm /etc/nginx/sites-enabled/default

#Files required
COPY ./srcs/wordpress /usr/share/nginx/html/wordpress
COPY ./srcs/init.sh .
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY ./srcs/config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
COPY ./srcs/wordpress_bdd.sql /usr/share/nginx/html/wordpress

#link creation
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#script
CMD /usr/bin/nginx -g "daemon off;"
CMD bash init.sh