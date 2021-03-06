#!/bin/sh

mkdir ~/Repos

# Add PPAs
sudo add-apt-repository ppa:webupd8team/atom
sudo add-apt-repository ppa:snwh/ppa
sudo apt-get update

# Common Programs
echo "Installing programs with apt"
sudo apt-get install atom automake calcurse cmatrix compton feh firefox gimp git gtk-chtheme i3wm i3status lxappearance moreutils mpv npm paper-icon-theme python3 python3-pip python3-setuptools qt4-qtconfig rofi rxvt-unicode-256color scrot stow thunar thunar-archive-plugin tmux vim w3m xbacklight zsh zsh-syntax-highlighting

# Background
echo "Downloading background"
wget https://cs.utexas.edu/~abellon/images/background.png -o ~/Pictures/background.png

# betterlockscreen
cd ~/Repos/
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
cp betterlockscreen ~/.local/bin/

# BootISO
echo "Installing BootISO"
cd ~/Repos/
git clone https://github.com/jsamr/bootiso.git
cd bootiso/
chmod +x bootiso
cd

# cheat.sh
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh

# Docker
sudo curl -sSL https://get.docker.com/ | sh
sudo apt-get update && sudo apt-get upgrade

# thef*ck
sudo pip3 install thefuck --user

# Git Summary
cd ~/Repos
git clone https://github.com/MirkoLedda/git-summary.git
cd git-summary
sudo cp git-summary /usr/local/bin/git-summary

# GIMP Theme
cd ~/Repos
git clone https://github.com/draekko/gimp-cc-themes.git
cd gimp-cc-themes
cp -r Gimp-CC-Theme-Darkest ~/.gimp-2.8/themes
cd

# Materia Theme
echo "Installing Materia theme"
cd ~/Repos/
wget -qO - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master
sudo ./install.sh
cd

# Neofetch
echo "Installing neofetch"
cd ~/Repos/
git clone https://github.com/dylanaraps/neofetch
cd neofetch
make install
cd

# pywal
echo "Installing pywal"
sudo pip3 install pywal

# rclone
curl https://rclone.org/install.sh | sudo bash

# Install Telegram

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# wal_steam
echo "Installing wal_steam"
cd ~/Repos/
git clone https://github.com/kotajacob/wal_steam.git
cd

# youtube_dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# =======================
#       i3 things :)
# =======================

if  [[ $1 = "-i" ]]; then
    echo "Installing i3 packages"
    
    # i3-gaps rounded
    cd ~/Repos
    git clone https://github.com/terroo/i3-radius
    cd i3-radius
    ./build.sh

    # i3-quickterm
    pip3 install --user i3ipc
    cd ~/Repos
    git clone https://github.com/lbonn/i3-quickterm.git
    cd i3-quickterm
    sudo cp i3-quickterm /usr/local/bin/i3_quickterm
    cd

    stow i3
fi

#stow everything
cd ~/Dotfiles

stow Firefox
stow neofetch
stow oh-my-zsh
stow rofi
stow Steam
stow Telegram
stow Thunar
stow tmux
stow vim
stow X
stow zsh
