# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR="vim"
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.config/zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.config/zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#
#
#
#
# Ruby
[[ -e "$HOME/.rvm" ]] && source $HOME/.rvm/scripts/rvm
#

# Office
[[ -f "$HOME/.config/office/.zshrc" ]] && source "$HOME/.config/office/.zshrc"
[[ -f "$HOME/.config/personal/.zshrc" ]] && source "$HOME/.config/personal/.zshrc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval "$(direnv hook zsh)"

# pnpm
export PNPM_HOME="/home/temp/.pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.files/.zsh/.p10k.zsh.
[[ ! -f ~/.files/.zsh/.p10k.zsh ]] || source ~/.files/.zsh/.p10k.zsh

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
else
  return 1
fi
alias cd=z
export PATH=$PATH:~/.conda/bin
