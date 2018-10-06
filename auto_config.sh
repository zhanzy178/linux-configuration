# Install necessary softwares and make linux server(Ubuntu or Debian) profile.

# get auth
sudo chown -R $USER $HOME

# update apt-get
sudo apt-get update

# base
sudo apt-get install apt-transport-https build-essential openssh-server \
    cmake python-pip python-setuptools m2crypto python3-dev wget -y

# git
sudo apt-get install git -y
git clone https://github.com/zhanzongyuan/linux-configuration.git
git config --global core.editor "vim"

# .bashrc configuration
cat ./linux-configuration/.bashrc>> ~/.bashrc
source ~/.bashrc

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

# go
# wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
wget https://mirrors.ustc.edu.cn/golang/go1.10.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz
rm -rf go1.10.1.linux-amd64.tar.gz
mkdir ~/go
mkdir ~/go/bin
mkdir ~/go/src
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export GOBIN=$GOPATH/bin" >> ~/bashrc
echo "export PATH=$PATH:/usr/local/go/bin:$GOBIN" >> ~/.bashrc
source ~/.bashrc
# install some tools
mkdir -p $GOPATH/src/golang.org/x/
cd $GOPATH/src/golang.org/x/
git clone https://github.com/golang/net.git
git clone https://github.com/golang/sys.git
git clone https://github.com/golang/tools.git
git clone https://github.com/golang/crypto.git
git clone https://github.com/golang/lint/golint
# go install github.com/ramya-rao-a/go-outline
# go install github.com/acroca/go-symbols
# go install github.com/josharian/impl
# go install github.com/rogpeppe/godef
# go install github.com/sqs/goreturns
# go install github.com/cweill/gotests/gotests
# go install github.com/ramya-rao-a/go-outline
# go install github.com/acroca/go-symbols
go install golang.org/x/tools/cmd/guru
go install golang.org/x/tools/cmd/gorename
go install github.com/golang/lint/golint
go install github.com/cweill/gotests/gotests
cd $HOME

# vim
# vim-plug need `sudo chown -R username /home/username` to get authority of the home directory.
sudo apt-get remove vim-common -y
sudo apt-get remove vim -y
git clone https://github.com/vim/vim.git
make -C vim
sudo make install -C vim
rm -rf vim
# Install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./linux-configuration/.vimrc ~/.vimrc
vim +'PlugInstall --sync' +qa
# Build YouCompleteMe
python3 ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --go-completer

# proxychains-ng
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config # installs /etc/proxychains.conf
echo "socks5 127.0.0.1 9088" >> /etc/proxychains.conf
cd ..
rm -rf proxychains-ng

# shadowsocks client
sudo pip install shadowsocks
sudo mv ./linux-configuration/shadowsocks /etc/shadowsocks 


# tmux
sudo apt-get install tmux -y
cp ./linux-configuration/.tmux.conf ~/.tmux.conf

# remove the configuration directory
rm -rf ./linux-configuration


