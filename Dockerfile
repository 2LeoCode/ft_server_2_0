FROM    debian:buster

ARG     SHARED=/var/www/ft_server
RUN		mkdir -p ${SHARED}/html

RUN		apt-get update && apt-get upgrade -y && apt-get install -y wget tar
RUN		apt-get install -y nginx
RUN		apt-get install -y mariadb-server expect
RUN		apt-get install -y php php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN		apt-get install -y php-pear php-gettext php-cgi
RUN		wget -c https://wordpress.org/latest.tar.gz -P /tmp && tar -xzf tmp/latest.tar.gz && rm -rf /tmp/latest.tar.gz
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz -P /tmp && tar -xzf tmp/phpMyAdmin-4.9.0.1-english.tar.gz && rm -rf tmp/phpMyAdmin-4.9.0.1-english.tar.gz

RUN		mkdir -p /etc/nginx/ssl
ADD		srcs/nginx.pem /etc/nginx/ssl
ADD		srcs/nginx.key /etc/nginx/ssl
ADD		srcs/mysql_setup.sh /tmp
ADD		srcs/boot.sh /root
ADD		srcs/perms.sql /tmp
RUN		chmod 755 /tmp/mysql_setup.sh
RUN		chmod 755 ~/boot.sh

RUN		chown -R $USER:$USER ${SHARED}/html
ADD		/srcs/conf/ft_server.conf /etc/nginx/sites-available
RUN		ln -s /etc/nginx/sites-available/ft_server.conf /etc/nginx/sites-enabled/
ADD		/srcs/conf/nginx.conf /etc/nginx
RUN		rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN		service mysql start && sh /tmp/mysql_setup.sh && rm -rf /tmp/mysql_setup.sh && sleep 2 && mysql < /tmp/perms.sql && rm -rf /tmp/perms.sql && service mysql stop

RUN		mv /wordpress /var/www/ft_server/html
RUN		chown -R www-data:www-data /var/www/ft_server/html/wordpress/
RUN		chmod 755 ${SHARED}/html/wordpress
ADD		srcs/conf/wp-config.php ${SHARED}/html/wordpress
RUN		rm -f ${SHARED}/html/wordpress/wp-config-sample.php

RUN 	mv phpMyAdmin-4.9.0.1-english ${SHARED}/html/phpmyadmin && rm -f ${SHARED}/html/phpmyadmin/config.sample.inc.php
ADD		srcs/conf/config.inc.php ${SHARED}/html/phpmyadmin/
RUN		chmod 660 ${SHARED}/html/phpmyadmin/config.inc.php
RUN		chown -R www-data:www-data ${SHARED}/html/phpmyadmin

EXPOSE	80
EXPOSE	443
EXPOSE	3306

CMD		[ "/bin/bash", "root/boot.sh" ]
