ZSH="$HOME/.oh-my-zsh"

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Oh My Zsh plugins
plugins=(
  gitfast
  brew
  nvm
  rbenv
  last-working-dir
  common-aliases
  sublime
  zsh-syntax-highlighting
  history-substring-search
)

# Actually load Oh-My-Zsh.
source "$ZSH/oh-my-zsh.sh"

# Projects using a local `bin` folder to store binstubs will let you
# run `rails` instead of `bin/rails`.
export PATH="./bin:$PATH"

# Include sbins.
export PATH="$PATH:/usr/local/sbin"

# Add MySQL 5.6's mysql.
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Yarn's bin.s
export PATH="$HOME/.yarn/bin:$PATH"

# Add your home bin directory.
export PATH="$HOME/bin:$PATH"

# Encoding stuff for the terminal.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Help rmagick find imagemagick 6's pkgconfig on gem install.
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

# Load z.
[[ -f "/usr/local/etc/profile.d/z.sh" ]] && source /usr/local/etc/profile.d/z.sh

# Load direnv.
eval "$(direnv hook zsh)"

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
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "~/.aliases" ]] && source "~/.aliases"

# Load local configuration
[ -f "~/.zshlocal" ] && source "~/.zshlocal"
