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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sidhartharya/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.conda/etc/profile.d/conda.sh" ]; then
        . "$HOME/.conda/etc/profile.d/conda.sh"
	conda config --set auto_activate_base false
    else
        export PATH="$HOME/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
#
#
#
# Ruby
[[ -e "$HOME/.rvm" ]] && source $HOME/.rvm/scripts/rvm
#
alias vim="bash ~/.config/nvim/start.sh"
alias nvim="bash ~/.config/nvim/start.sh"

# Office
[[ -f "$HOME/.config/office/.zshrc" ]] && source "$HOME/.config/office/.zshrc"
[[ -f "$HOME/.config/personal/.zshrc" ]] && source "$HOME/.config/personal/.zshrc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval "$(direnv hook zsh)"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/sidhartharya/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/sidhartharya/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zshexport PATH=$PATH:/Users/sidhartharya/bin

# pnpm
export PNPM_HOME="/Users/sidhartharya/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.files/.zsh/.p10k.zsh.
[[ ! -f ~/.files/.zsh/.p10k.zsh ]] || source ~/.files/.zsh/.p10k.zsh
