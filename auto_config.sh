# Install necessary softwares and make linux server(Ubuntu or Debian) profile.

# echo `# get auth` && \
# sudo chown -R $USER $HOME && \
# \
# \

function lang {
    echo ""
    echo "------------*-lang-*--------------"
    cd $HOME && \
    export LC_ALL=C
}

function apt_update {
    echo ""
    echo "------------*-apt-*--------------"
    # update apt-get
    cd $HOME && \
    sudo apt-get update
}

function base_pkg {
    echo ""
    echo "------------*-base-pkg-*--------------"
    # base
    cd $HOME
    sudo apt-get install apt-transport-https -y
    sudo apt-get install build-essential -y
    sudo apt-get install openssh-server -y
    sudo apt-get install cmake -y
    sudo apt-get install python-pip -y
    sudo apt-get install python-setuptools -y
    sudo apt-get install m2crypto -y
    sudo apt-get install python3-dev -y
    sudo apt-get install python-dev -y
    sudo apt-get install curl -y
    sudo apt-get install libncursesw5-dev -y
    sudo apt-get install libncurses5-dev -y
}

function git_install {
    echo ""
    echo "------------*-git-*--------------"
    # git
    cd $HOME && \
    sudo apt-get install git -y && \
    git config --global core.editor "vim"
}

function bashrc_cfg {
    echo ""
    echo "------------*-.bashrc-*--------------"
    # .bashrc configuration
    cd $HOME && \
    cat ./linux-configuration/.bashrc>> ~/.bashrc && \
    source ~/.bashrc
}

function nodejs_install {
    echo ""
    echo "------------*-nodejs-*--------------"
    # nodejs npm
    # https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
    cd $HOME && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    sudo apt-get install -y nodejs
}

function redis_install {
    echo ""
    echo "------------*-redis-*--------------"
    # redis-server
    cd $HOME && \
    sudo apt-get install -y redis-server
}

function go_install {
    echo ""
    echo "------------*-golang-*--------------"
    # go`
    # wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
    cd $HOME && \
    wget https://mirrors.ustc.edu.cn/golang/go1.10.1.linux-amd64.tar.gz && \
    sudo tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz && \
    rm -rf go1.10.1.linux-amd64.tar.gz && \
    mkdir ~/go && \
    mkdir ~/go/bin && \
    mkdir ~/go/src && \
    echo "export GOPATH=\$HOME/go" >> ~/.bashrc && \
    echo "export GOBIN=\$GOPATH/bin" >> ~/.bashrc && \
    echo "export PATH=\$PATH:/usr/local/go/bin:\$GOBIN" >> ~/.bashrc && \
    source ~/.bashrc

    # install some tools
    echo "install some tools"
    mkdir -p $GOPATH/src/golang.org/x/ && \
    cd $GOPATH/src/golang.org/x/
    git clone https://github.com/golang/net.git
    git clone https://github.com/golang/sys.git
    git clone https://github.com/golang/tools.git
    git clone https://github.com/golang/crypto.git
    git clone https://github.com/golang/lint.git
    go install golang.org/x/tools/cmd/guru
    go install golang.org/x/tools/cmd/goimports
    go install golang.org/x/tools/cmd/gorename
    go install golang.org/x/lint/golint
}

function vim_install {
    echo ""
    echo "------------*-vim-*--------------"
    # vim
    # vim-plug need `sudo chown -R username /home/username` to get authority of the home directory.
    cd $HOME && \
    sudo apt-get remove vim-common -y && \
    sudo apt-get remove vim -y && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    ./configure --with-features=huge \
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
    make && \
    make install

    echo "# Install plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    cp ./linux-configuration/.vimrc ~/.vimrc && \
    vim +'PlugInstall --sync' +qa && \
    echo `# Build YouCompleteMe` && \
    cd ~/.vim/plugged/ && \
    git clone https://github.com/Valloric/YouCompleteMe.git && \
    cd YouCompleteMe/ && \
    git submodule update --init --recursive && \
    python3 install.py --clang-completer --go-completer && \
    cd $HOME && \
    rm -rf vim && \
    sudo ln -s /usr/local/bin/vim /bin/vi
}


function proxy_install {
    echo ""
    echo "------------*-proxy-*--------------"
    # proxychains-ng
    cd $HOME && \
    git clone https://github.com/rofl0r/proxychains-ng.git && \
    cd proxychains-ng && \
    ./configure --prefix=/usr --sysconfdir=/etc && \
    make && \
    make install && \
    make install-config && \
    sudo echo "socks5 127.0.0.1 9088" >> /etc/proxychains.conf && \
    cd $HOME && \
    rm -rf proxychains-ng
}

function ss_install {
    echo ""
    echo "------------*-ss-*--------------"
    # shadowsocks client
    cd $HOME && \
    pip install shadowsocks && \
    sudo mv ./linux-configuration/shadowsocks /etc/shadowsocks
}


function tmux_install {
    echo ""
    echo "------------*-tmux-*--------------"
    # tmux
    cd $HOME && \
    sudo apt-get install tmux -y && \
    cp ./linux-configuration/.tmux.conf ~/.tmux.conf
}

function mysql_install {
    echo ""
    echo "------------*-mysql-*--------------"
    # mysql
    # https://help.ubuntu.com/lts/serverguide/mysql.html
    cd $HOME && \
    sudo apt-get install -y mysql-server && \
    sudo apt-get install -y mysql-client
}

function clear_all {
    cd $HOME
    rm -rf go1.10.1.linux-amd64.tar.gz
    rm -rf linux-configuration
#     rm -rf .error.log
    rm -rf proxychains-ng
    rm -rf vim
    rm -rf auto_config.sh
}


git clone https://github.com/zhanzy178/linux-configuration.git


echo "------------*-lang-*--------------" >>.error.log
echo "" >>.error.log
lang 2>>.error.log


echo "------------*-apt-update-*--------------" >>.error.log
echo "" >>.error.log
apt_update 2>>.error.log


echo "------------*-base-pkg-*--------------" >>.error.log
echo "" >>.error.log
base_pkg 2>>.error.log


echo "------------*-git-*--------------" >>.error.log
echo "" >>.error.log
echo "" >>.error.log
git_install 2>>.error.log


echo "------------*-bashrc-*--------------" >>.error.log
echo "" >>.error.log
bashrc_cfg 2>>.error.log


echo "------------*-nodejs-*--------------" >>.error.log
echo "" >>.error.log
nodejs_install 2>>.error.log


echo "------------*-tmux-*--------------" >>.error.log
echo "" >>.error.log
tmux_install 2>>.error.log


echo "------------*-proxy-*--------------" >>.error.log
echo "" >>.error.log
proxy_install 2>>.error.log


echo "------------*-ss-*--------------" >>.error.log
echo "" >>.error.log
ss_install 2>>.error.log


echo "------------*-go-*--------------" >>.error.log
echo "" >>.error.log
go_install 2>>.error.log


echo "------------*-vim-*--------------" >>.error.log
echo "" >>.error.log
vim_install 2>>.error.log
# redis_install 2>>.error.log
# mysql_install 2>>.error.log

# report error
echo ""
echo "------------*-.error.log-*--------------"
cat .error.log

echo "------------*-clear-*--------------"
clear_all
