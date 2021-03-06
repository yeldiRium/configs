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

# Generic Colorizer
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

