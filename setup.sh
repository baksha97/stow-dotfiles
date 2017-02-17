# Basic file system setup
mkdir -p $HOME/work/git

# Remove Message of the day prompt
touch $HOME/.hushlogin

# TODO: add ssh setup script from github.com/shakeelmohamed/dotfiles
# TODO: rename that repo to dotfiles-old
# TODO: rename this repo to dotfiles
# TODO: git clone this repo, which becomes...
# git clone git@github.com/shakeelmohamed/dotfiles.git

# TODO: these both hijack the shell session and don't let the rest of this file complete
# Install zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# setup GH token here
# https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew
#and then set the token as: export HOMEBREW_GITHUB_API_TOKEN="your_new_token"

# Install all homebrew packages
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew install "$line"
done < "./brew.txt"

# Install all cask packages
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew cask install "$line"
done < "./cask.txt"

# SSH config
stow ssh -t $HOME/

stow bash -t $HOME
rm $HOME/.zshrc
stow zsh -t $HOME

# Sublime text configs
stow sublime -t "$HOME/Library/Application Support/Sublime Text 3/"

# Node.js setup
nvm install 6
npm install -g trash-cli

# bro pages, simpler man pages
sudo gem install bropages

# TODO: CLI tool for installing things from app store
# https://github.com/herrbischoff/awesome-osx-command-line

# Get the Monokai terminal theme - this should be last
open ./Monokai.terminal
