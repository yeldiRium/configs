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

## node dev
alias node13='docker run -ti -w /app -v $(pwd):/app --user="$(id -u):$(id -g)" node:13 node'
alias node13b='docker run -ti -w /app -v $CONFIG_DIR/zsh/various/docker.bashrc:/home/node/.bashrc:ro -v $(pwd):/app --user="$(id -u):$(id -g)" node:13 bash'
alias node12='docker run -ti -w /app -v $(pwd):/app --user="$(id -u):$(id -g)" node:12 node'
alias node12b='docker run -ti -w /app -v $CONFIG_DIR/zsh/various/docker.bashrc:/home/node/.bashrc:ro -v $(pwd):/app --user="$(id -u):$(id -g)" node:12 bash'
alias node10='docker run -ti -w /app -v $(pwd):/app --user="$(id -u):$(id -g)" node:10 node'
alias node10b='docker run -ti -w /app -v $CONFIG_DIR/zsh/various/docker.bashrc:/home/node/.bashrc:ro -v $(pwd):/app --user="$(id -u):$(id -g)" node:10 bash'

alias node='node12'
alias npm='docker run -ti -w /app -v $(pwd):/app --user="$(id -u):$(id -g)" node:12 npm'
alias yarn='docker run -ti -w /app -v $(pwd):/app --user="$(id -u):$(id -g)" node:12 yarn'

## php
alias psysh='docker run -tiv $(pwd):/app -u 1000:1000 composer:1.9.1 php vendor/bin/psysh'

# kubectl autocompletion
source <(kubectl completion zsh)

source ~/.secret

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
bindkey -s "\C-r" "hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
