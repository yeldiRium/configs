export CONFIG_DIR="$HOME/querbeet/workspace/configs/"
source ./system_config.sh

export TERMINAL="termite"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim

export LAUNCHPAD_CHROME=/usr/bin/chromium
export BROWSER=/usr/bin/chromium

export GOPATH=$HOME/go

source $CONFIG_DIR/zsh/environment/xdg.sh
source $CONFIG_DIR/zsh/environment/hstr.sh
source $CONFIG_DIR/zsh/environment/less.sh

export PATH=~/.local/bin:/usr/local/lib:$PATH
export PATH=~/querbeet/workspace/tools/:$PATH
export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.secretenv
