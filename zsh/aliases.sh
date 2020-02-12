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

## docker
dockerAliases="-v $CONFIG_DIR/zsh/various/aliases.sh:/etc/profile.d/aliases.sh:ro"
dockerPwd="-w /app -v \$(pwd):/app"
dockerUser="--user=\"$(id -u):$(id -g)\""

alias doc="docker-compose"

## node dev
nodeDockerCmd="docker run -ti $dockerUser $dockerPwd"
alias node13="$nodeDockerCmd node:13 node"
alias node12="$nodeDockerCmd node:12 node"
alias node10="$nodeDockerCmd node:10 node"
nodeDockerBCmd="docker run -ti $dockerAliases -w /app"
alias node13b="$nodeDockerBCmd node:13 bash -l"
alias node12b="$nodeDockerBCmd node:12 bash -l"
alias node10b="$nodeDockerBCmd node:10 bash -l"

alias node="node12"

## php
alias psysh='docker run -tiv $(pwd):/app -u 1000:1000 composer:1.9.1 php vendor/bin/psysh'

# kubectl autocompletion
source <(kubectl completion zsh)

source ~/.secret

# HSTR configuration - add this to ~/.bashrc
bindkey -s "\C-r" " hstr\n"     # bind hstr to Ctrl-r (for Vi mode check doc)
