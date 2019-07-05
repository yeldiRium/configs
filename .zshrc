ZSH=~/.oh-my-zsh/
ZSH_THEME="avit-custom"
plugins=(
	docker # completion
	kubectl # aliases and completion
	npm # completion
	git # a LOT of aliases for git
	pip # completion
	python # completion
	wd # efficient directory switching
)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/yeldir/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# manual zsh configuration
setopt COMPLETE_ALIASES
setopt LIST_AMBIGUOUS
setopt LIST_ROWS_FIRST
setopt AUTO_CD
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# important environment
export LAUNCHPAD_CHROME=/usr/bin/google-chrome-stable
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# movement
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char

# aliases
alias ls='ls --color=auto'
alias ll='ls -al'

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


eval $(thefuck --alias)

# git
alias amend='git commit --amend'
alias amendno='git commit --amend --no-edit'

# utility
alias ll='ls -al'

# add npm-do for executing local packages
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

source ~/.secret

# kubectl autocompletion
source <(kubectl completion zsh)

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HSTR_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
