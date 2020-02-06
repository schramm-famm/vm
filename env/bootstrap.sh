echo "### Provisioning starting!"
echo "### Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo apt-key add - > /dev/null
echo "### Setting up Docker repository..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" > /dev/null
echo "### Adding MongoDB GPG key..."
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | \
    sudo apt-key add - > /dev/null
echo "### Creating MongoDB list file..."
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | \
    sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list > /dev/null
echo "### Updating source list..."
sudo apt-get -qy update > /dev/null
echo "### Installing dependencies..."
sudo apt-get -qy install \
    apt-transport-https \
    build-essential \
    ca-certificates \
    containerd.io \
    curl \
    docker-ce \
    docker-ce-cli \
    gnupg-agent \
    mongodb-org \
    mysql-server \
    python3-pip \
    software-properties-common \
    unzip \
    vim > /dev/null
if [[ -z $(sudo snap list | grep microk8s) ]]; then
    echo "### Installing Kubernetes..."
    sudo snap install microk8s --classic > /dev/null
fi
echo "### Installing AWS..."
pip3 install -q awscli --upgrade
echo "### Installing Go..."
sudo wget -q https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo tar -xvf go1.13.linux-amd64.tar.gz > /dev/null
if [ -d "/usr/local/go" ]; then
	rm -rf /usr/local/go
fi
sudo mv go /usr/local
echo "### Installing Terraform..."
if [ ! -f "/usr/bin/terraform" ]; then
    sudo wget -q https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
    sudo unzip terraform_0.12.13_linux_amd64.zip -d /usr/bin > /dev/null
fi
if [[ -z $(docker images |  grep mongo) ]]; then
    echo "### Pulling mongo docker image..."
    docker pull mongo > /dev/null
fi
if [[ -z $(docker container ls | grep MONGODB) ]]; then
    echo "### Starting mongo docker container..."
    docker run -d --hostname MONGODB --name=MONGODB --net=bridge --expose=27017\
        mongo:latest > /dev/null
fi
echo "### Setting up configuration..."
rm -rf $HOME/.bashrc $HOME/.vimrc $HOME/.vim
ln -s /vm/env/.vimrc $HOME/.vimrc
ln -s /vm/env/.vim $HOME/.vim
ln -s /vm/env/.bashrc $HOME/.bashrc
echo "### Starting MongoDB..."
sudo service mongod start
echo "### Provisioning complete!"
