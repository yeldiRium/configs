ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="avit"
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
alias dchome='xrandr --output LVDS-1 --off --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-2 --primary --mode 1920x1080 --pos -1920x376'
alias dcmobile='xrandr --output HDMI-2 --off --output VGA-1 --off --output LVDS-1 --auto --primary'

# add npm-do for executing local packages
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

source ~/.secret

# kubectl autocompletion
source <(kubectl completion zsh)

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HSTR_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
