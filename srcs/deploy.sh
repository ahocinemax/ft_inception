
sudo apt-get update -y

apt-get install make -y
apt-get install ssh -y
apt-get install \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl \
    gnupg \
    lsb-release -y

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) stable"

apt-get update -y
apt-get install docker-ce docker-ce-cli -y

# Install Docker Compose
apt-get install python3-pip -y
pip3 install docker-compose

sudo apt update
sudo apt install -y curl wget

curl -s https://api.github.com/repos/docker/compose/releases/latest | \
grep browser_download_url | grep docker-compose-Linux-x86_64 | cut -d '"' -f 4 | wget -qi -

chmod +x docker-compose-Linux-x86_64

sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose

sudo usermod -aG docker $USER
newgrp docker

# Install Nginx
apt-get install nginx -y

docker-compose version
docker -version