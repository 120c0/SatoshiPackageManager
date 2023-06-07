#!/bin/bash
ALACRITTY_DOWNLOAD_FILE="v0.12.1.tar.gz"
ALACRITTY_DIRECTORY="alacritty-0.12.1"
TEMP=$(mktemp -d)
PWD=$(pwd)

sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cd $TEMP

wget https://github.com/alacritty/alacritty/archive/refs/tags/$ALACRITTY_DOWNLOAD_FILE
tar -xvhf $ALACRITTY_DOWNLOAD_FILE
cd $ALACRITTY_DIRECTORY
sleep 5

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile=default
source $HOME/.cargo/env
cargo build --release --no-default-features --features=x11

mkdir -p $HOME/.local/bin
cp target/release/alacritty $HOME/.local/bin
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/alacritty 10