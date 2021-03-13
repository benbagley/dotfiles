# /bin/bash

sudo pacman -Sy nodejs yarn zsh alacritty python pavucontrol yay base-devel
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install paru to replace pacman
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

# snapd
sudo paru -Syu
paru -S snapd
sudo snap install discord

# setup KVMs
yay -S quemu ovmf virt-manager dnsmasq ebtables libvirt-daemon-driver-lxc librewolf brave
virt-manager -c 'qemu:///session'

# bluetooth
sudo systemctl enable bluetooth
sudo service bluetooth start

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.zshrc
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.zshrc
brew install gcc

# make zsh default
chsh -s $(which zsh)
