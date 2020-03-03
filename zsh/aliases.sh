alias ls='ls --color=auto'
alias ll='ls -al'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

## git
alias amend='git commit --amend'
alias amendno='git commit --amend --no-edit'

## docker
alias doc="docker-compose"

## php
alias psysh='docker run -tiv $(pwd):/app -u 1000:1000 composer:1.9.1 php vendor/bin/psysh'

# kubectl autocompletion
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion zsh)
fi

source ~/.secret

# HSTR configuration - add this to ~/.bashrc
bindkey -s "\C-r" " hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
