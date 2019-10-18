#!/bin/sh
if type nvim > /dev/null 2>&1; then
cd $HOME
wget https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
cp -r squashfs-root/usr/share/nvim/ /usr/share/
cp squashfs-root/usr/bin/nvim /usr/bin/
rm -rf squashfs
rm nvim.appimage*
source /epsilon/venv/bin/activate
pip install --upgrade pynvim && pip3 install --upgrade pynvim
mkdir -p $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
cat > $HOME/.config/nvim/init.vim <<EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/dotfiles/.vimrc
EOF
fi
