source ./system_config.sh

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

source $CONFIG_DIR/zsh/environment/rvm.sh
source $CONFIG_DIR/zsh/environment/nvm.sh

source ~/.secretenv
