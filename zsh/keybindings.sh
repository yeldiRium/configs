# movement
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
