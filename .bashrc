#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval $(thefuck --alias)

# lokal
alias initwpa='sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -D wext && sudo dhcpcd wlp3s0'

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
alias dchome='xrandr --output LVDS-1 --off --output VGA-1 --auto --panning 1920x1080+1920+350 --output HDMI-2 --auto --panning 1920x1080+0+0 --primary'
alias dcvert='xrandr --output LVDS-1 --off --output VGA-1 --auto --panning 1920x1080+0+0 --primary --output HDMI-2 --auto --panning 1920x1080+0+1080'
alias dcmobile='xrandr --output HDMI-1 --off --output HDMI-2 --off --output VGA-1 --off --output LVDS-1 --auto --primary'
alias dcvert2='xrandr --output LVDS-1 --off --output VGA-1 --auto --panning 1920x1080+0+1080 --primary --output HDMI-2 --auto --panning 1920x1080+0+0'

# gource
alias gourceFull='gource efla-web/ --seconds-per-day 1 --file-idle-time 0 --title "Ste3k101" --key -1920x1080 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 20 -threads 0 -bf 0 gource.mp4'

# environment variables
export npm_config_prefix=~/.node_modules

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


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
