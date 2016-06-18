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
# Update sources & install tools
# ------------------------------
sudo apt-get -y update
sudo apt-get install -y curl
sudo apt-get install -y ack-grep
sudo apt-get install -y htop
sudo apt-get install -y net-tools

rm -rf ~/.vimrc
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/colors

# ------------------------------
# Install and setup Git
#------------------------------
sudo apt-get install git-core -y
git config --global color.ui true

echo '.*swp' > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# ------------------------------
# Install  Z - Shell
#------------------------------
sudo apt-get install zsh -y
sudo chsh -s $(which zsh) $(whoami)
git submodule add https://github.com/Leisenfelder/dotfiles/zshrc.git ~/.vim/zshrc
ln -s ~/.vim/zshrc ~/.zshrc

# ------------------------------
# Install tmux
#------------------------------
sudo apt-get install tmux -y
git submodule add https://github.com/Leisenfelder/dotfiles/tumx.conf.git ~/.vim/tmux.conf
ln -s ~/.vim/tmux.conf ~/.tmux.conf

# ------------------------------
# Development tools
# ------------------------------
sudo apt-get install build-essential -y
sudo apt-get install python-pip
sudo apt-get install python-setuptools

## pip packages ###
sudo pip install jedi
sudo pip install virtualenv
sudo pip install pyflakes
sudo pip install nose
sudo pip install jupyter

# ------------------------------
# Install Vim
#------------------------------
sudo apt-get install vim -y
git submodule add https://github.com/Leisenfelder/dotfiles/vimrc.git ~/.vim/vimrc
ln -s ~/.vim/vimrc ~/.vimrc

git init
git commit -m "Initial commit"

### pathogen.vim: manage your runtimepath  #####
git submodule add https://github.com/tpope/vim-pathogen.git ~/.vim/bundle/pathogen
git submodule update --init
ln -s bundle/pathogen/autoload/ autoload

### Syntastic:  syntax checking plugin for Vim that runs files through external syntax checkers and displays any resulting errors to the user
git submodule add https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git submodule update --init

#### File trees  #####
git submodule add https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git submodule update --init

git submodule add https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/vim-nerdtree-tabs
git submodule update --init

git submodule add https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git submodule update --init

git submodule add https://github.com/fholgado/minibufexpl.vim.git ~/.vim/bundle/minibufexpl
git submodule update --init

git submodule add https://github.com/wincent/Command-T.git ~/.vim/bundle/command-t
git submodule update --init

git submodule add https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack
git submodule update --init

git submodule add https://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git submodule update --init


git submodule add https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp
git submodule update --init

####  statusline plugin  ####
git submodule add https://github.com/Lokaltog/vim-powerline bundle/powerline
git submodule update --init

git submodule add https://github.com/Leisenfelder/dotfiles/wombat256mod.vim.git ~/.vim/colors/wombat256mod.vim
git submodule update --init

####  Tab completes plugin  ####
git submodule add https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git submodule update --init

#### editing  plugins ######
git submodule add https://github.com/tpope/vim-surround.git ~/.vim/bundle/surround
git submodule update --init

git submodule add https://github.com/msanders/snipmate.vim.git ~/.vim/bundle/snipmate
git submodule update --init
git submodule add https://github.com/Leisenfelder/dotfiles/snippets ~/.vim/bundle/snipmate/snippets

#### Git wrappers  ###
git submodule add https://github.com/tpope/vim-git.git ~/.vim/bundle/git
git submodule update --init

git submodule add https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive
git submodule update --init

## python packages ###
git submodule add https://github.com/fs111/pydoc.vim.git ~/.vim/bundle/pydoc
git submodule update --init

git submodule add https://github.com/sontek/rope-vim.git ~/.vim/bundle/ropevim
git submodule update --init

git submodule add https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode
git submodule update --init

git submodule add https://github.com/alfredodeza/pytest.vim.git ~/.vim/bundle/py.test
git submodule update --init

git submodule add https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
git submodule update --init

git submodule add https://github.com/vim-scripts/pep8.git ~/.vim/bundle/pep8
git submodule update --init

## C++ packages ###
git submodule add https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/bundle/OmniCppComplete
git submodule update --init

git  submodule add https://github.com/vim-scripts/OmniCppComplete.git ~/.vim/tags
git submodule update --init

git submodule add https://github.com/reinh/vim-makegreen ~/.vim/bundle/makegreen
git submodule update --init

git submodule add https://github.com/vim-scripts/SyntaxComplete.git ~/.vim/bundle/syntaxcomplete
git submodule update --init
