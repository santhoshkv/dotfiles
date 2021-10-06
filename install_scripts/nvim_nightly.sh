#!/bin/sh
rpm -q epel-release || sudo yum -y install epel-release openssl-devel
sudo yum makecache
rpm -q python36 || sudo yum -y install python36 python-pip python3-devel
pip2 install neovim
pip2 install ipdb
pip3 install neovim
cd $HOME
wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
cp -r squashfs-root/usr/share/nvim/ /usr/share/
cp squashfs-root/usr/bin/nvim /usr/bin/
rm -rf squashfs
rm nvim.appimage*
source /venv/bin/activate
pip3 install --upgrade pynvim
touch $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/nvim/.config .
