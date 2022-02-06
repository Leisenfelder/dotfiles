#!/bin/bash
#
# **************************************************************************
# **************************************************************************
#
# Authors: Herb Leisenfelder
# Description:  Set up Development Enviroment
#
# ***************************************************************************
# ***************************************************************************
#
# ------------------------------
# install Envirment
# ------------------------------
rm -rf .v*
rm -rf .x*
rm -rf .z*
rm -rf .g*
rm -rf .t*
setxkbmap -layout jp
sudo apt-get install -y uim
export LANG=ja_JP.UTF-8
export OUTPUT_CHARSET=utf-8
export LV="-Ou8"

# ------------------------------
# Update sources & install tools
# ------------------------------
sudo apt-get update -y
sudo apt-get install -y curl
sudo apt-get install -y ack-grep
sudo apt-get install -y htop
sudo apt-get install -y net-tools

# ------------------------------
# Install tmux
#------------------------------
sudo apt-get install -y tmux
rm -rf ~/.tmux.conf
ln -s ~/bin/dotfile/tmux.conf ~/.tmux.conf

# ------------------------------
# Install ssh-server
#------------------------------
sudo apt-get install -y openssh-server

# ------------------------------
# Development tools
# ------------------------------
sudo apt-get install -y build-essential
sudo apt-get install -y python3 python3-pygt5
sudo apt-get install -y python-pip
sudo apt-get install -y python-setuptools
sudo apt-get install -y irssi irssi-scripts screen
sudo apt-get install -y git-all get-review

# ------------------------------
# Install Vim
#------------------------------
sudo apt-get install -y vim
rm -rf ~/.vimrc
ln -s ~/bin/dotfiles/vimrc ~/.vimrc


## pip packages ###
sudo pip install flake8 pyflakes pep8 pylint jedi
sudo pip install virtualenv
sudo pip install jupyter numpy matplotlib pandas

# ------------------------------
# Install and setup Git
#------------------------------

git config --global color.ui true
echo '.*swp' > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "leisenfelder@gmail.com"
git config --global user.name "leisenfelder"

# ------------------------------
# Install  Z - Shell
#------------------------------
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)
compaudit | xargs chmod -R 555
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc
ln -s ~/bin/dotfiles/zshrc ~/.zshrc
