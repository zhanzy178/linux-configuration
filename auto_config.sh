# Install necessary softwares and make linux server(Ubuntu or Debian) profile.

# update apt-get
sudo apt-get update

# base
sudo apt-get install apt-transport-https build-essential -y

# git
sudo apt-get install git -y
git clone https://github.com/zhanzongyuan/linux-configuration.git
git config --global core.editor "vim"

# .bashrc configuration
cat ./linux-configuration/.bashrc>> ~/.bashrc
source ~/.bashrc

# vim
sudo apt-get remove vim-common -y
sudo apt-get install vim -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./linux-configuration/.vimrc ~/.vimrc

# tmux
sudo apt-get install tmux -y
cp ./linux-configuration/.tmux.conf ~/.tmux.conf

# remove the configuration directory
rm -rf ./linux-configuration

# nodejs npm
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# redis-server
sudo apt-get install -y redis-server

# mysql
# https://help.ubuntu.com/lts/serverguide/mysql.html
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client
