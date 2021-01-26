# /bin/bash

sudo pacman -Sy nodejs yarn zsh alacritty python pavucontrol yay base-devel
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

# snapd
sudo pacman -Syu
paru -S snapd
sudo snap install discord

# setup KVMs
sudo apt install quemu ovmf virt-manager dnsmasq ebtables libvirt-daemon-driver-lxc
virt-manager -c 'qemu:///session'

# bluetooth
sudo systemctl enable bluetooth
sudo service bluetooth start

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.zshrc
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.zshrc
brew install gcc

# Install spotify
sudo pacman -Sy && yay -S spotify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

brew install khanhas/tap/spicetify-cli

# set perfs path in config
spicetify config prefs_path .config/spotify/prefs

echo 'export SPICETIFY_INSTALL="/home/benbagley/spicetify-cli"' >> .zshrc
echo 'export PATH="$SPICETIFY_INSTALL:$PATH"' >> .zshrc

git clone https://github.com/morpheusthewhite/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
cd ..

spicetify backup apply
spicetify config current_theme Dribbblish
spicetify config color_scheme Horizon

cd "$(dirname "$(spicetify -c)")/Themes/Dribbblish"
cp dribbblish.js ../../Extensions
spicetify config extensions dribbblish.js
cd

spicetify apply

# make zsh default
chsh -s $(which zsh)
