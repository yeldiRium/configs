alias ls='ls --color=auto'
alias ll='ls -al'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


eval $(thefuck --alias)

## git
alias amend='git commit --amend'
alias amendno='git commit --amend --no-edit'

## utility
alias ll='ls -al'

## php
alias psysh='docker run -tiv $(pwd):/app -u 1000:1000 composer:1.9.1 php vendor/bin/psysh'

# kubectl autocompletion
source <(kubectl completion zsh)

source ~/.secret

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
bindkey -s "\C-r" "hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
