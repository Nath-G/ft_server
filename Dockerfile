# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/06 11:22:31 by nagresel          #+#    #+#              #
#    Updated: 2020/01/07 17:16:42 by nagresel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from debian:buster
run apt-get update
run apt-get upgrade
run apt-get -y install nginx
#for wordpress LEMP stack is required
#run apt-get install cmake libncursesw5-dev libncurses5-dev cmake build-essential libssl-dev pkg-config
run apt-get -y install mariadb-server mariadb-client
run apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
#run mysql_secure_installation
#cmd en plus 
copy ./srcs/init.sh .
copy ./srcs/ngnix.conf ./etc/nginx/sites-available/localhost/

#1 seule cmd autorisee au lancement de l'installation init.sh est le script de lancement une fois le conteneur lance
cmd bash init.sh
#CMD /usr/bin/nginx -g "daemon off;"
