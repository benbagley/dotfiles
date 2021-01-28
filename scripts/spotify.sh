# /bin/bash

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
