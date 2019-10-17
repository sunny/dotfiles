#!/bin/zsh

set -e

link() {
  from=$PWD/links/$1
  to=$HOME/$1
  if [[ ! -f $to ]]; then
    echo $to
    ln -s $from $to
  fi
}

# zsh plugins
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
cd "$CURRENT_DIR"

# Links
link .aliases
link .gemrc
link .gitconfig
link .gitignore
link .irbrc
link .rspec
link .tmux.conf
link .zshrc
link .hushlogin

# Local file
touch "$HOME/.zshlocal"
