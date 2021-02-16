CREATE USER 'admin'@locahost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@localhost IDENTIFIED BY 'admin';
GRANT USAGE ON *.* to 'admin'@localhost IDENTIFIED BY 'admin';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wp.* TO 'wordpress'@localhost IDENTIFIED BY 'wordpress';
FLUSH PRIVILEGES;
