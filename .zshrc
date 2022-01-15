export REACT_APP_LOCAL="true"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/harshasomisetty/.cargo/bin:$PATH"
export PATH="/Library/Frameworks/R.framework/Resources:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="/Users/harshasomisetty/.oh-my-zsh"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init --path)"
# fi

# export PATH="/usr/local/opt/cython/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/bzip3/include"
export PATH="/Users/harshasomisetty/.local/share/solana/install/active_release/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

export PATH=$PATH:~/.node/bin

export ZPLUG_HOME=~/.config/zplug
source ~/.config/zplug/init.zsh

export PAT="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"


. "$HOME/.cargo/env"



ZSH_THEME=""

autoload -U promptinit; promptinit 
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:branch color red
zstyle :prompt:pure:path color blue
prompt pure

plugins=(
git
brew
node
npm
rand-quote
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

zplug "zdharma/zsh-diff-so-fancy", as:command, use:"bin/"

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

alias vim="nvim"
alias oldvim="vim"
gitzip="git archive HEAD -o ${PWD##*/}.zip"
alias r="radian"
alias tsm="transmission-remote"

alias s="solana"
alias ls='ls --color=auto'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
alias config='/usr/bin/git --git-dir=/Users/harshasomisetty/.cfg/ --work-tree=/Users/harshasomisetty'
