source $CONFIG_DIR/zsh/oh-my-zsh.sh
source $CONFIG_DIR/zsh/zsh-config.sh
source $CONFIG_DIR/zsh/keybindings.sh

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/yeldir/.zshrc'

autoload -Uz compinit
compinit

# aliases
source $CONFIG_DIR/zsh/aliases.sh

# NVM setup
source $CONFIG_DIR/zsh/nvm.sh

# HSTR configuration
source $CONFIG_DIR/zsh/hstr.sh

# GH completion
eval "$(gh completion -s zsh)"

# NIX setup (https://nixos.org/nix/manual/#chap-quick-start)
if [ -e /home/yeldir/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yeldir/.nix-profile/etc/profile.d/nix.sh; fi

if [[ -x $TOOLS_DIR/wvl ]]; then $TOOLS_DIR/wvl; fi

# Generic Colorizer
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

