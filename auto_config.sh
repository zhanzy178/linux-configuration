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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./linux-configuration/.vimrc ~/.vimrc

# tmux
sudo apt-get install tmux -y

# remove the configuration directory
rm -rf ./linux-configuration

# nodejs npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
