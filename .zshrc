# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.cache/zplug/init.zsh
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=history
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Direnv
eval "$(direnv hook zsh)"

# Zoxide
eval "$(zoxide init zsh)"
alias nnn='m a nnn; nnn -x -g'
alias tmux='tmux -u'
alias source_modules='source ~/.config/zsh/modules.sh'
alias hm='home-manager'
alias flake='nix flake'
alias code='code --ozone-platform=wayland'
alias cd='z'

# Functions
flaker ()
{
  nix flake init -t ~/.config/flake-templates#${1};
}


zstyle ':completion:*' menu select
setopt complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

source ~/.config/zsh/modules.sh
