# Install necessary softwares and make linux server(Ubuntu or Debian) profile.

echo `# get auth` && \
sudo chown -R $USER $HOME && \
\
\
export LC_ALL=C && \
\
\
echo `# update apt-get` && \
sudo apt-get update && \
\
\
echo `# base` && \
sudo apt-get install apt-transport-https -y && \
sudo apt-get install build-essential -y && \
sudo apt-get install openssh-server -y && \
sudo apt-get install cmake -y && \
sudo apt-get install python-pip -y && \
sudo apt-get install python-setuptools -y && \
sudo apt-get install m2crypto -y && \
sudo apt-get install python3-dev -y && \
sudo apt-get install python-dev -y && \
sudo apt-get install curl -y && \
sudo apt-get install libncursesw5-dev -y && \
sudo apt-get install libncurses5-dev -y && \
\
\
echo `# git` && \
sudo apt-get install git -y && \
git clone https://github.com/zhanzy178/linux-configuration.git && \
git config --global core.editor "vim" && \
\
\
echo `# .bashrc configuration` && \
cat ./linux-configuration/.bashrc>> ~/.bashrc && \
source ~/.bashrc && \
\
\
echo `# nodejs npm` && \
echo `# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions` && \
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
sudo apt-get install -y nodejs && \
\
\
echo `# redis-server` && \
sudo apt-get install -y redis-server && \
\
\
echo `# go` && \
echo `# wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz` && \
wget https://mirrors.ustc.edu.cn/golang/go1.10.1.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz && \
rm -rf go1.10.1.linux-amd64.tar.gz && \
mkdir ~/go && \
mkdir ~/go/bin && \
mkdir ~/go/src && \
echo "export GOPATH=\$HOME/go" >> ~/.bashrc && \
echo "export GOBIN=\$GOPATH/bin" >> ~/.bashrc && \
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOBIN" >> ~/.bashrc && \
source ~/.bashrc && \
echo `# install some tools` && \
mkdir -p $GOPATH/src/golang.org/x/ && \
cd $GOPATH/src/golang.org/x/ && \
git clone https://github.com/golang/net.git && \
git clone https://github.com/golang/sys.git && \
git clone https://github.com/golang/tools.git && \
git clone https://github.com/golang/crypto.git && \
git clone https://github.com/golang/lint.git && \
go install golang.org/x/tools/cmd/guru && \
go install golang.org/x/tools/cmd/goimports && \
go install golang.org/x/tools/cmd/gorename && \
go install golang.org/x/lint/golint && \
cd $HOME && \
\
\
echo `# vim` && \
echo `# vim-plug need `sudo chown -R username /home/username` to get authority of the home directory.` && \
sudo apt-get remove vim-common -y && \
sudo apt-get remove vim -y && \
git clone https://github.com/vim/vim.git && \
cd vim && \
sudo ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local && \
sudo make && \
sudo make install && \
echo `# Install plug` && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
sudo cp ./linux-configuration/.vimrc ~/.vimrc && \
vim +'PlugInstall --sync' +qa && \
echo `# Build YouCompleteMe` && \
cd ~/.vim/plugged/ && \
git clone https://github.com/Valloric/YouCompleteMe.git && \
cd YouCompleteMe/ && \
git submodule update --init --recursive && \
python3 install.py --clang-completer --go-completer && \
cd $HOME && \
sudo rm -rf vim && \
sudo ln -s /usr/local/bin/vim /bin/vi && \
\
\
echo `# proxychains-ng` && \
git clone https://github.com/rofl0r/proxychains-ng.git && \
cd proxychains-ng && \
./configure --prefix=/usr --sysconfdir=/etc && \
sudo make && \
sudo make install && \
sudo make install-config && \
sudo echo "socks5 127.0.0.1 9088" >> /etc/proxychains.conf && \
cd $HOME && \
sud rm -rf proxychains-ng && \
\
\
echo `# shadowsocks client` && \
sudo pip install shadowsocks && \
sudo mv ./linux-configuration/shadowsocks /etc/shadowsocks  && \
\
\
echo `# tmux` && \
sudo apt-get install tmux -y && \
sudo cp ./linux-configuration/.tmux.conf ~/.tmux.conf && \
\
\
echo `# remove the configuration directory` && \
sudo rm -rf ./linux-configuration && \
sudo chown -R $USER $HOME



# \
# \
# echo `# mysql` && \
# echo `# https://help.ubuntu.com/lts/serverguide/mysql.html` && \
# sudo apt-get install -y mysql-server && \
# sudo apt-get install -y mysql-client && \
