alias ls='exa'
alias ll='exa --long --grid --group --all --header --git'
alias lt='exa --long        --group --all --header --git --tree --level'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

## php
alias psysh='docker run -tiv $(pwd):/app -u 1000:1000 composer:1.9.1 php vendor/bin/psysh'

# kubectl autocompletion
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion zsh)
fi

# neuron (https://github.com/srid/neuron)
alias zk-se='code $(neuron search)'
alias zk-sc="neuron search | rev | cut -d '/' -f 1 | rev | cut -d '.' -f 1 | xclip -sel clip -r"
alias zk-st="neuron query | jq -r '.result[].zettelTags[]' | sort | uniq | dmenu | xclip -sel clip -r"

zk-qt() {
    if [ ! -n $1 ]
    then
	echo "please enter a tag to query for"
    else
	neuron query -t $1 | jq '.result[] | { id: .zettelID, title: .zettelTitle }'
    fi
}

source ~/.secret

