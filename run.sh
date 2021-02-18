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

os=$(uname)

echo "Shutting down nginx/apache..."
if [ "$os" = "Linux" ]
then
	systemctl stop nginx > /dev/null 2>&1
	systemctl stop apache2 > /dev/null 2>&1
elif [ "$os" = "Darwin" ]
then
	nginx -s stop > /dev/null 2>&1
	apachectl stop > /dev/null 2>&1
fi

echo "Running container..."
docker rm -f ft_server > /dev/null 2>&1
docker run -td -e NGINX_AUTOINDEX="$autoindex" -p 80:80 -p 443:443 --name ft_server ft_server:latest > /dev/null 2>&1
docker exec -ti ft_server /bin/bash
