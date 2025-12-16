ZSH="$HOME/.oh-my-zsh"

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="sunny"

# Skip the verification of insecure directories.
ZSH_DISABLE_COMPFIX="true"

# Oh My Zsh plugins
plugins=(
  common-aliases
  dotenv
  gitfast
  history-substring-search
  last-working-dir
  nvm
  rbenv
  you-should-use
)

# Actually load Oh-My-Zsh.
source "$ZSH/oh-my-zsh.sh"

# Added by `rbenv init` on Tue Feb 25 15:52:12 CET 2025
eval "$(rbenv init - --no-rehash zsh)"

# Include sbins.
export PATH="$PATH:/usr/local/sbin"

# Helm 2 bins.
#export PATH="/usr/local/opt/helm@2/bin:$PATH"

# MySQL 5.6 bins.
#export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# InfluxDB
#export PATH="/usr/local/opt/influxdb@1/bin:$PATH"

# pip3
export PATH="$PATH:/Users/sunny/Library/Python/3.9/bin"

# pipx
export PATH="$PATH:/Users/sunny/.local/bin"

# Yarn's bins.
export PATH="$HOME/.yarn/bin:$PATH"

# Your home bin directory.
export PATH="$HOME/bin:$PATH"

# Projects using a local `bin` folder to store binstubs will let you
# run `rails` instead of `bin/rails`.
export PATH="./bin:$PATH"

# Encoding stuff for the terminal.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Gnu Make instead of make
#PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Editors
export EDITOR=vim
export RAILS_EDITOR=vscode

# Help rmagick find imagemagick 6's pkgconfig on gem install.
# export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig
# export LDFLAGS="-L/opt/homebrew/opt/imagemagick@6/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/imagemagick@6/include"
# export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"

# MySQL 5.6
#export DYLD_LIBRARY_PATH=/usr/local/opt/mysql@5.6/bin:$DYLD_LIBRARY_PATH

# On MySQL 5.6 gem installs you may also need:
#export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
#export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

# Postgres 12 and libpq
#export LDFLAGS="-L/usr/local/opt/postgresql@12/lib -L/usr/local/opt/libpq/lib"
#export CPPFLAGS="-I/usr/local/opt/postgresql@12/include -I/usr/local/opt/libpq/include"

# export C_INCLUDE_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
# export CPLUS_INCLUDE_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1

# https://github.com/ansible/ansible/issues/32499#issuecomment-341578864
#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Load z.
[[ -f "/usr/local/etc/profile.d/z.sh" ]] && source /usr/local/etc/profile.d/z.sh

# Load direnv.
if hash direnv 2> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# iTerm2 shell integration.
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Nvm bash completion.
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Nvm autoloading
# Via https://medium.com/@kinduff/automatic-version-switch-for-nvm-ff9e00ae67f3
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
if hash nvm 2> /dev/null; then
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Load local configuration
[ -f "$HOME/.zshlocal" ] && source "$HOME/.zshlocal"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/Users/sunny/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Command line Fuzzy Finder
source ~/.fzf.zsh

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# z command to jump to common directories
source /opt/homebrew/etc/profile.d/z.sh

# ZSH Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH history substring search
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# ZSH Syntax highlighting (must be called last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
