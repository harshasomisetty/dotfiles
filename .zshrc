export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/harshasomisetty/.cargo/bin:$PATH"
export PATH="/Library/Frameworks/R.framework/Resources:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/harshasomisetty/.oh-my-zsh"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/bzip3/include"
export PATH="/Users/harshasomisetty/.local/share/solana/install/active_release/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

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

alias config='/usr/bin/git --git-dir=/Users/harshasomisetty/.cfg/ --work-tree=/Users/harshasomisetty'

source $ZSH/oh-my-zsh.sh
