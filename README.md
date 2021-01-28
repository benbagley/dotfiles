# dotfiles
Here are scripts to setup dotfiles https://gist.github.com/benbagley/8f69dcccd017361d2c68db09bd99b793

How to use and setup dotfiles
https://www.atlassian.com/git/tutorials/dotfiles

### Setup environment

1. Install Ubuntu or another distro (using popOS)
2. Run `install` script
3. Sign into firefox and setup ext, add SSH key to github
4. Clone and setup dotfiles
5. Run `install rails` script
6. Logout and back in again

###########################################################

### From scratch
> git init --bare $HOME/.dotfiles
> alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
> config config --local status.showUntrackedFiles no
> echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
> echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
> cd .dotfiles
> config checkout -b main
> config commit -am "inital commit"
> config push -u origin main

### Setting up files on a new system
> echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
> echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
> source ~/.zshrc
> git clone --bare git@github.com:benbagley/dotfiles.git $HOME/.dotfiles
> config config --local status.showUntrackedFiles no
> config checkout

### Pushing and adding files (example)
> config status
> config add .vimrc
> config commit -m "Add vimrc"
> config add .bashrc
> config commit -m "Add bashrc"
> config push
