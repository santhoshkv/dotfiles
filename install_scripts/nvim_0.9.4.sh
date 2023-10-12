#!/bin/sh
cd $HOME
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
cp -r squashfs-root/usr/share/nvim/ /usr/share/
cp squashfs-root/usr/bin/nvim /usr/bin/
rm -rf squashfs
rm nvim.appimage*
ln -s $HOME/dotfiles/nvim/.config .
echo "Done"
