#!/bin/sh

sudo apt install zsh
sudo chsh -s $(which zsh)
chsh -s $(which zsh)

cp zprofile ../.zprofile
cp zshrc ../.zshrc
