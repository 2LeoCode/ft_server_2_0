#!/bin/bash

useindex=0
autoindex="off"

printf "Do you want to use an autoindex ? [ Y/n ]"

read -n1 useindex

if [ "$useindex" = "y" ] || [ "$useindex" = "Y" ]
then
	autoindex="on"
fi

docker rm -f ft_server > /dev/null 2>&1
docker run -td -e NGINX_AUTOINDEX="$autoindex" -p 80:80 -p 443:443 --name ft_server ft_server:latest > /dev/null 2>&1
docker exec -ti ft_server /bin/bash
