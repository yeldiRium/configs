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

