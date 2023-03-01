CREATE DATABASE IF NOT EXISTS inceptiondb;
CREATE USER IF NOT EXISTS 'ahocine'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON inceptiondb.* TO 'ahocine'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED by 'password';