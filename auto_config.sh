# Install necessary softwares and make linux server(Ubuntu or Debian) profile.

# update apt-get
sudo apt-get update

# git
sudo apt-get install git -y
git clone https://github.com/zhanzongyuan/linux-configuration.git
cat ./linux-configuration/.bashrc>> ~/.bashrc

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./linux-configuration/.vimrc ~/.vimrc

# tmux
sudo apt-get install tmux -y

# remove the configuration directory
rm -rf ./linux-configuration
