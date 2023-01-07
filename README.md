# Setup

```
echo ".cfg" >> .gitignore
git clone --bare https://github.com/harshasomisetty/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```


Setup Background at [attlassian](https://www.atlassian.com/git/tutorials/dotfiles) and [ackama explanation](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)

## New Laptop setup script

```
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

## Brew casks
```
brew tap railwaycat/emacsmacport
brew tap homebrew/cask-fonts

brew install --cask iterm2 spotify emacs-mac visual-studio-code telegram zoom font-fira-code font-nunito

brew install pyenv rustup nvm gh the_silver_searcher coreutils openblas pyenv-virtualenv rust-analyzer bash-completion cmake bzip2 gnu-tar


# optional
brew install --cask google-chrome vlc transmission whatsapp discord notion signal slack figma
```


*Optional*


## Dev setup
```
pyenv install 
rustup-init
nvm install node

sh -c "$(curl -sSfL https://release.solana.com/v1.14.11/install)"

cargo install --git https://github.com/coral-xyz/anchor avm --locked --force
avm install latest
avm use latest


git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
doom sync
```

## App store apps
[Magnet](https://apps.apple.com/us/app/magnet/id441258766?mt=12)
[Hand Mirror](https://apps.apple.com/us/app/hand-mirror/id1502839586?mt=12)