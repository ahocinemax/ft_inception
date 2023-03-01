# su -

# # Allow members of group sudo to execute any command
# echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# sudo apt-get install build-essential docker.io git curl -y

# DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
# mkdir -p $DOCKER_CONFIG/cli-plugins
# curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
# chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# docker exec -it mysql -u ahocine -ppassword -e "CONNECT inceptiondb; SHOW TABLES;"
