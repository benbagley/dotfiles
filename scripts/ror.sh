# /bin/bash

echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.zshrc
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc

brew install rbenv
brew install ruby-build

rbenv install 2.7.2
rbenv global 2.7.2

sudo snap install mysql --beta
sudo snap install postgresql10 beekeeper-studio

echo "Don't forget to setup your users"

sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install sublime-merge --classic

echo "Don't forget to add your sublime license keys"
echo "Restart the terminal or logout for rbenv to take affect"

export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib/pkgconfig"

# Run these after terminal restart
# gem install bundler
# gem install rails
# rbenv rehash
# ruby -v
# rails -v
