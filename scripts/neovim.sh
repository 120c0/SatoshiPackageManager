#!/bin/bash
NEOVIM_DOWNLOAD_FILE="v0.9.1.tar.gz"
NEOVIM_DIRECTORY="neovim-0.9.1"
TEMP=$(mktemp -d)
PWD=$(pwd)

cd $TEMP
wget https://github.com/neovim/neovim/archive/refs/tags/$NEOVIM_DOWNLOAD_FILE
tar -xvhf $NEOVIM_DOWNLOAD_FILE

cd $NEOVIM_DIRECTORY
sudo apt install build-essential cmake git pkg-config libtool-bin g++ libunibilium4 libunibilium-dev ninja-build gettext autoconf automake unzip curl -y

sudo make -j4 CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/opt/neovim install
sudo ln -s /opt/neovim/bin/nvim /usr/local/bin/nvim