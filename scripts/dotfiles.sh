#!/bin/bash
cp -r ~/.zshrc ~/dotfiles
cp -r ~/.config/assets ~/dotfiles
cp -r ~/.config/btop ~/dotfiles
cp -r ~/.config/hypr ~/dotfiles
cp -r ~/.config/hyprpanel ~/dotfiles
cp -r ~/.config/nvim ~/dotfiles
cp -r ~/.config/spicetify ~/dotfiles
cp -r ~/.config/tofi ~/dotfiles
cp -r ~/.config/wezterm ~/dotfiles
cp -r ~/.config/wlogout ~/dotfiles
cp -r ~/.config/starship.toml ~/dotfiles
cp -r ~/.config/dolphinrc ~/dotfiles
cp -r ~/scripts/ ~/dotfiles
cp -r ~/scripts/ ~/dotfiles

cd ~/dotfiles
git add --all
git commit -m "."
git push origin main
