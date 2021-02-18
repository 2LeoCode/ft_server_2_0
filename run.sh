#!/bin/bash

input=0
autoindex="off"

while [ "$input" != "y" ] && [ "$input" != "Y" ] && [ "$input" != "n" ] && [ "$input" != "N" ]
do
	printf "\rDo you want to use an autoindex ? [ Y/n ]"
	read -n1 input
done
echo

if [ "$input" = "y" ] || [ "$input" = "Y" ]
then
	autoindex="on"
fi

listening=$(netstat -ntpl|grep -c :80 > /dev/null 2>&1)
if [ "$listening" = "1" ]
then
	echo "Something is listening on port :80. Shutting down nginx/apache"
	systemctl stop nginx
	systemctl stop apache2
fi

docker rm -f ft_server > /dev/null 2>&1
echo "Running container..."
docker run -td -e NGINX_AUTOINDEX="$autoindex" -p 80:80 -p 443:443 --name ft_server ft_server:latest > /dev/null 2>&1
docker exec -ti ft_server /bin/bash
