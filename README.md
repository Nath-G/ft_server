# ft_server
1 - Démarrer docker grâce au script init_docker.sh de la 42_tools_box
#-Commandes docker- :
 * docker build . -t test : permet de builter le docker -t est l'option du nom du tagici test
* docker run -p80:80 -p443:443 -t -d test : permet de mettre en route le process -p precise les ports -t le nom du tag -d run en mode detachee (le proces tour ne meme si la console est fermee).
* docker exec -ti 3b7a38f87941 bash : permet de rentrer dans le container grace au numero d'identifiant liste grace a la commande ci-dessous :
* docker ps -a : permet de lister les images existantes et si elles sont toujours lancees 
* docker stop adbed92ba3ce  && docker rm adbed92ba3ce : permet de stopper et de supprimer une image

#Commentaires :
Le package wordpress a ete installe une fois, le site a ete cree puis le dossier ainsi cree a ete copie dans le dossier source afin d'etre copier a l'installation de docker.

#Documentation :
    [SSL](https://linuxize.com/post/creating-a-self-signed-ssl-certificate/)
!! Utiliser ENTRYPOINT vs CMD pour les image multi mode

Documentation :
https://www.linuxbabe.com/debian/install-lemp-stack-debian-10-buster
