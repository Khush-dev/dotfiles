#! /bin/bash

sudo apt-get update
sudo apt-get install git curl wget terminator zsh vim zathura mpv
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

## zsh plugins
export ZSH_CUSTOM="~/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

## nnn
wget https://github.com/jarun/nnn/releases/download/v4.6/nnn-nerd-static-4.6.x86_64.tar.gz -O nnn
tar -xjvf nnn
sudo cp ./nnn-nerd-static /usr/local/bin/nnn
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

## NerdFonts
mkdir ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts/jetbrains
unzip RobotoMono.zip -d ~/.fonts/roboto

cp terminator_config ~/.config/terminator/config

## Vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ets-labs/python-vimrc/master/setup.sh)"
sudo apt install build-essential cmake vim-nox python3-dev exuberant-ctags
sudo apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cp vimrc ~/.vim/vimrc
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
cd -

# ## advcpmv
# curl https://raw.githubusercontent.com/jarun/advcpmv/master/install.sh --create-dirs -o ./advcpmv/install.sh && (cd advcpmv && sh install.sh)
# sudo mv ./advcpmv/advcp /usr/local/bin/cpg
# sudo mv ./advcpmv/advmv /usr/local/bin/mvg
