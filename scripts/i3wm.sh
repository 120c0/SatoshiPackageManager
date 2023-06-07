PWD=$(pwd)
TEMPLATE=$PWD/templates

mkdir -p $HOME/.config/i3
sudo apt install i3-wm i3status ninja-build fonts-firacode x11-xserver-utils bridge-utils xinit cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
sudo cp -f $TEMPLATE/Keyboard.config /usr/share/X11/xorg.conf.d/Keyboard-10.conf
sudo cp -f $TEMPLATE/i3status.config /etc/i3status.conf
sudo cp -f $TEMPLATE/xinitrc.config $HOME/.xinitrc

cp -f $TEMPLATE/i3.config $HOME/.config/i3/config