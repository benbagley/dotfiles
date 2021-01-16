# /bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install git

# setup GitHub
echo "What is your github username?: "
read username
echo "What is your github email?: "
read email

git config --global color.ui true
git config --global user.name "$username"
git config --global user.email "$email"
ssh-keygen -t rsa -b 4096 -C "$email"

echo "Don't forget to add your ssh key into GitHub"
