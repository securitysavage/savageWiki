-- Change DB name and user to your docker-compose.yml values
CREATE USER savage@'%' IDENTIFIED BY 'savagewiki';
CREATE DATABASE savagewiki;
GRANT ALL PRIVILEGES ON savagewiki.* TO savage@'%';
flush privileges;
quit
