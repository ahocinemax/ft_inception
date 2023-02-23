if [ ! -f /var/www/html/wp-config.php ];
then
    wget    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    mv      wp-cli.phar /usr/local/bin/wp