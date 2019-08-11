export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-unstable

export PATH=~/querbeet/workspace/tools/:~/.local/bin:$PATH

# HSTR configuration
export HSTR_CONFIG=hicolor
export HSTR_CONFIG=raw-history-view
export HSTR_CONFIG=keywords-matching

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/usr/share/nvm/init-nvm.sh" ]] && source /usr/share/nvm/init-nvm.sh
