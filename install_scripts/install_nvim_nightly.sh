#!/bin/sh
rpm -q epel-release || sudo yum -y install epel-release openssl-devel
sudo yum makecache
rpm -q python36 || sudo yum -y install python36 python-pip python3-devel
pip2 install neovim
pip2 install ipdb
pip3 install neovim
cd $HOME
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
cp -r squashfs-root/usr/share/nvim/ /usr/share/
cp squashfs-root/usr/bin/nvim /usr/bin/
rm -rf squashfs
rm nvim.appimage*
source /venv/bin/activate
pip install --upgrade pynvim
mkdir -p $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
cat > $HOME/.config/nvim/init.vim <<EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/dotfiles/nvim/.vimrc
EOF
