# /bin/bash

sudo apt install nodejs yarn zsh alacritty python pavucontrol
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# snapd
sudo apt update
sudo apt install snapd
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
sudo apt-get install build-essential
brew install gcc

# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R

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
spicetify config color_scheme Dracula
spicetify apply

# make zsh default
chsh -s $(which zsh)
