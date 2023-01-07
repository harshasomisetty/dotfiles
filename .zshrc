export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/bzip3/include"

# export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

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
web-search
jsontools
)

ZSH_THEME="gozilla"

alias ls='ls --color=auto'

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
# export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh



source $ZSH/oh-my-zsh.sh



