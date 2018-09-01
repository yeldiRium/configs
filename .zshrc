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

# aliases
alias ls='ls --color=auto'
alias ll='ls -al'

eval $(thefuck --alias)

# git
alias amend='git commit --amend'
alias amendno='git commit --amend --no-edit'
alias pull='git pull --rebase'
alias log='git log --oneline --decorate'

# dev
alias phpspec='php vendor/bin/phpspec'
alias java-open='archlinux-java set java-8-openjdk'
alias java-oracle='archlinux-java set java-8-jdk'

## symfony
alias startsymfony='php bin/console server:start'
alias stopsymfony='php bin/console server:stop'

## php
alias phpunitip='phpunit --process-isolation'

# utility
alias ll='ls -al'
alias dchome='xrandr --output LVDS-1 --off --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-2 --primary --mode 1920x1080 --pos 1080x376'
alias dcmobile='xrandr --output HDMI-2 --off --output VGA-1 --off --output LVDS-1 --auto --primary'

# gource
function gourceVid() {
	gource $1 --seconds-per-day 1 --file-idle-time 0 --title "Ste3k101" --key -1920x1080 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 20 -threads 0 -bf 0 $2
}

alias gourceFull='gource efla-web/ --seconds-per-day 1 --file-idle-time 0 --title "Ste3k101" --key -1920x1080 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 20 -threads 0 -bf 0 gource.mp4'

# add npm-do for executing local packages
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

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


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
