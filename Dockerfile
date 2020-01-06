# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/06 11:22:31 by nagresel          #+#    #+#              #
#    Updated: 2020/01/06 16:56:55 by nagresel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from debian:buster
run apt-get update
run apt-get upgrade
run apt-get -y install nginx
#cmd en plus 
copy ./srcs/init.sh .
#1 seule cmd autorisee au lancement de l'installation init.sh est le script de lancement une fois le conteneur lance
cmd bash init.sh
#CMD /usr/bin/nginx -g "daemon off;"
