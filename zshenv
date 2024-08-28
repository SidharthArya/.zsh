export ZDOTDIR=~/.config/zsh
export HISTFILE=~/.cache/zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
export ZPLUG_HOME=~/.cache/zplug
alias ls='ls --color=auto'
# export PATH="/usr/local/bin:/usr/bin:/bin"

if [ -e /home/arya/.nix-profile/etc/profile.d/nix.sh ]; then . /home/arya/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
