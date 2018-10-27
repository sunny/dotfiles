ZSH=$HOME/.oh-my-zsh

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

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
export PATH="./bin:${PATH}:/usr/local/sbin"
export PATH="~/bin:${PATH}"

# Add MySQL 5.6's mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load z
[[ -f "/usr/local/etc/profile.d/z.sh" ]] && source /usr/local/etc/profile.d/z.sh

# Load direnv
eval "$(direnv hook zsh)"

# Helps rmagick find imagemagick 6's pkgconfig on gem install
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load local configuration
[ -f ~/.zshlocal ] && source ~/.zshlocal
