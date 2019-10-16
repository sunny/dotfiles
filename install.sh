#!/bin/zsh

set -e
setopt nocasematch

backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file?
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ]; then
      backup $target

      if [ ! -e "$target" ]; then
        echo "-----> Symlinking your new $target"
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

# zsh plugins
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
cd "$CURRENT_DIR"

# Local file
if [[ ! -f "$HOME/.zshlocal" ]]; then
  echo 'export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1"' > "$HOME/.zshlocal"
fi

# Sublime Text
if [[ ! `uname` =~ "darwin" ]]; then
  SUBL_PATH=~/.config/sublime-text-3
else
  SUBL_PATH=~/Library/Application\ Support/Sublime\ Text\ 3
fi

mkdir -p "$SUBL_PATH/Packages/User $SUBL_PATH/Installed Packages"
backup "$SUBL_PATH/Packages/User/Preferences.sublime-settings"

PACKAGE_CONTROL_URL="https://sublime.wbond.net/Package%20Control.sublime-package"
PACKAGE_CONTROL_PATH="$SUBL_PATH/Installed Packages/Package Control.sublime-package"

if [[ ! -f $PACKAGE_CONTROL_PATH ]]; then
  curl -k $PACKAGE_CONTROL_URL > $PACKAGE_CONTROL_PATH
fi

if [[ ! -f "$SUBL_PATH/Packages/User/Preferences.sublime-settings" ]]; then
  ln -s "$PWD/Preferences.sublime-settings" "$SUBL_PATH/Packages/User"
fi

if [[ ! -f "$SUBL_PATH/Packages/User/Package Control.sublime-settings" ]]; then
  ln -s "$PWD/Package Control.sublime-settings" "$SUBL_PATH/Packages/User"
fi

# Commented out because of weird parsing bug
#if [[ ! -f "$SUBL_PATH/Packages/User/Default (OSX).sublime-keymap" ]]; then
#  ln -s "$PWD/Default (OSX).sublime-keymap" "$SUBL_PATH/Packages/User"
#end

