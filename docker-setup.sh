echo "update apt-get"
sudo apt update -y 

echo "install dependencies"
sudo apt install apt-transport-https ca-certificates curl software-properties-common

echo "download docker gpg key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "add docker repo"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

echo "policy"
apt-cache policy docker-ce

echo "install docker"
sudo apt install docker-ce


echo "check docker version"
docker --version

echo "add user to docker group"
sudo usermod -aG docker ${USER}

