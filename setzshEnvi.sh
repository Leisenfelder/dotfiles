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

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/colors

# ------------------------------
# Install and setup Git
#------------------------------
sudo apt-get install -y git-core
git config --global color.ui true

echo '.*swp' > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git init
git commit -m "Initial commit"
git submodule add -f https://github.com/Leisenfelder/dotfiles.git ~/.vim
git submodule update --init

# ------------------------------
# Install  Z - Shell
#------------------------------
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)
compaudit | xargs chmod -R 555
rm -rf ~/.zshrc
ln -s ~/.vim/zshrc ~/.zshrc

# ------------------------------
# Install tmux
#------------------------------
sudo apt-get install -y tmux
rm -rf ~/.tmux.conf
ln -s ~/.vim/tmux.conf ~/.tmux.conf

# ------------------------------
# Install X-server
#------------------------------
sudo apt-get install -y xserver-xorg
sudo apt-get install -y xinit
sudo apt-get install -y xterm

ln -s ~/.vim/xession ~/.xession
ln -s ~/.vim/Xdefaults ~/.Xdefaults
ln -s ~/.vim/xinitrc ~/.xinitrc

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

## pip packages ###
sudo pip install jedi
sudo pip install virtualenv
sudo pip install pyflakes
sudo pip install nose
sudo pip install jupyter

# ------------------------------
# Install Vim
#------------------------------
sudo apt-get install -y vim -y
ln -s ~/.vim/vimrc ~/.vimrc
rm -rf ~/.vimrc

### pathogen.vim: manage your runtimepath  #####
git submodule add -f https://github.com/tpope/vim-pathogen.git ~/.vim/bundle/pathogen
git submodule update --init
ln -s ~/.vim/bundle/pathogen/autoload/ ~/.vim/autoload

### Syntastic:  syntax checking plugin for Vim that runs files through external syntax checkers and displays any resulting errors to the user
git submodule add -f https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git submodule update --init

#### File trees  #####
git submodule add -f https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git submodule update --init

git submodule add -f https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/vim-nerdtree-tabs
git submodule update --init

git submodule add -f https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git submodule update --init

git submodule add -f https://github.com/fholgado/minibufexpl.vim.git ~/.vim/bundle/minibufexpl
git submodule update --init

git submodule add -f https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack
git submodule update --init

git submodule add -f https://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git submodule update --init

git submodule add -f https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp
git submodule update --init

####  statusline plugin  ####
git submodule add -f https://github.com/Lokaltog/vim-powerline bundle/powerline
git submodule update --init

git submodule add -f https://github.com/Leisenfelder/dotfiles/wombat256mod.vim.git ~/.vim/colors/wombat256mod.vim
git submodule update --init

####  Tab completes plugin  ####
git submodule add -f https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git submodule update --init

#### editing  plugins ######
git submodule add -f https://github.com/tpope/vim-surround.git ~/.vim/bundle/surround
git submodule update --init

git submodule add -f https://github.com/msanders/snipmate.vim.git ~/.vim/bundle/snipmate
git submodule update --init
git submodule add https://github.com/Leisenfelder/dotfiles/snippets ~/.vim/bundle/snipmate/snippets

#### Git wrappers  ###
git submodule add -f https://github.com/tpope/vim-git.git ~/.vim/bundle/git
git submodule update --init

git submodule add -f https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive
git submodule update --init

## python packages ###
git submodule add -f https://github.com/fs111/pydoc.vim.git ~/.vim/bundle/pydoc
git submodule update --init

git submodule add https://github.com/sontek/rope-vim.git ~/.vim/bundle/ropevim
git submodule update --init

git submodule add -f https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode
git submodule update --init

git submodule add -f https://github.com/alfredodeza/pytest.vim.git ~/.vim/bundle/py.test
git submodule update --init

git submodule add -f https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
git submodule update --init

git submodule add -f https://github.com/vim-scripts/pep8.git ~/.vim/bundle/pep8
git submodule update --init

## C++ packages ###
git submodule add -f https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/bundle/OmniCppComplete
git submodule update --init

git  submodule add -f https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/tags
git submodule update --init

git submodule add -f https://github.com/reinh/vim-makegreen ~/.vim/bundle/makegreen
git submodule update --init

git submodule add -f https://github.com/vim-scripts/SyntaxComplete.git ~/.vim/bundle/syntaxcomplete
git submodule update --init
