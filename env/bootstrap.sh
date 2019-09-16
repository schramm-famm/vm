echo "### Provisioning starting!"
echo "### Updating source list..."
sudo apt-get -qy update > /dev/null
echo "### Installing dependencies..."
sudo apt-get -qy install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    vim > /dev/null
echo "### Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "### Setting up Docker repository..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" > /dev/null
echo "### Updating source list..."
sudo apt-get -yq update > /dev/null
echo "### Installing Docker..."
sudo apt-get -yq install docker-ce docker-ce-cli containerd.io > /dev/null
echo "### Setting up configuration"
rm -rf $HOME/.bashrc $HOME/.vimrc $HOME/.vim
ln -s /vm/env/.vimrc $HOME/.vimrc
ln -s /vm/env/.vim $HOME/.vim
ln -s /vm/env/.bashrc $HOME/.bashrc
echo "### Provisioning complete!"
