#!/bin/zsh

set -e

link() {
  from="$PWD/links/$1"
  to="$2"
  [[ ! $to ]] && to="$HOME/$1"

  if [[ ! -f $to ]]; then
    echo "-----> Linking $to"
    mkdir -p "`dirname $to`"
    ln -s $from $to
  fi
}

copy() {
  from="$PWD/copies/$1"
  to="$2"
  [[ ! $to ]] && to="$HOME/$1"

  if [[ ! -f $to ]]; then
    echo "-----> Creating $to"
    mkdir -p "`dirname $to`"
    cp $from $to
  fi
}

install_zsh_plugin() {
  CURRENT_DIR=`pwd`
  ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
  mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
  if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
  fi
  cd "$CURRENT_DIR"
}

# Plugins
install_zsh_plugin

# Links
link .aliases
link .gemrc
link .gitconfig
link .gitignore
link .irbrc
link .psqlrc
link .rspec
link .tmux.conf
link .zshrc
link .hushlogin
link bin/git-fetch-and-delete
link bin/gh-rename-master
link .psql/.keep
link vscode-settings.json "$HOME/Library/Application Support/Code/User/settings.json"
link keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"

# Copies
copy .config/git/template/HEAD
copy .zshlocal
