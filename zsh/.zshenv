export CONFIG_DIR="$HOME/querbeet/workspace/configs/"
export TOOLS_DIR="$HOME/querbeet/workspace/tools/"
export WVL_DIR="$HOME/querbeet/stuff/private/wvl/"
source ~/system_config.sh

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim

export TERMINAL=termite
export TERM=termite

export LAUNCHPAD_CHROME=/usr/bin/chromium
export BROWSER=/usr/bin/chromium

export GOPATH=$HOME/go

source $CONFIG_DIR/zsh/environment/xdg.sh
source $CONFIG_DIR/zsh/environment/hstr.sh
source $CONFIG_DIR/zsh/environment/less.sh

export PATH=~/.local/bin:/usr/local/lib:$PATH
export PATH=~/querbeet/workspace/tools/:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin

# Add Nix environment.
if [ -e /home/yeldir/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yeldir/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.secretenv
