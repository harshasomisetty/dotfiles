export REACT_APP_LOCAL="true"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/harshasomisetty/.cargo/bin:$PATH"
export PATH="/Library/Frameworks/R.framework/Resources:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/harshasomisetty/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init --path)"
# fi

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/bzip3/include"
export PATH="/Users/harshasomisetty/.local/share/solana/install/active_release/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

export PATH=$PATH:~/.node/bin

source ~/.zplug/init.zsh

. "$HOME/.cargo/env"

plugins=(
git
brew
node
npm
sudo
yarn
z
colorize
colored-man-pages
cp
zsh-syntax-highlighting
zsh-autosuggestions
vi-mode
zsh-vimode-visual
)

fpath+=~/.zsh/pure
ZSH_THEME=""

autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:branch color red
zstyle :prompt:pure:path color blue
prompt pure

gitzip="git archive HEAD -o ${PWD##*/}.zip"

alias r="radian"
alias tsm="transmission-remote"

alias ls='ls --color=auto'

alias config='/usr/bin/git --git-dir=/Users/harshasomisetty/.cfg/ --work-tree=/Users/harshasomisetty'

source $ZSH/oh-my-zsh.sh
