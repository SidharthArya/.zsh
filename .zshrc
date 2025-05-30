# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
#
#
alias plugins=~/.config/zsh/plugins.sh

plugins powerlevel10k https://github.com/romkatv/powerlevel10k.git
plugins zsh-autsuggestions https://github.com/zsh-users/zsh-autosuggestions 


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.cache/zsh/powerlevel10k/powerlevel10k.zsh-theme 
# source ~/.cache/zplug/init.zsh
# zplug romkatv/powerlevel10k, as:theme, depth:1
#
#
source ~/.cache/zsh/zsh-autsuggestions/zsh-autosuggestions.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Direnv
eval "$(direnv hook zsh)"

# Zoxide
#
alias source_modules='source ~/.config/zsh/modules.sh'
source_modules
eval "$(zoxide init zsh)"
alias nnn='m a nnn; nnn -x -g'
alias tmux='tmux -u'

alias hm='home-manager'
alias ls='lsd'
alias l='lsd'

alias lg='lazygit'
alias flake='nix flake'
alias code='code --ozone-platform=wayland'
alias cd='z'
t_convertvidtogif () {
  ffmpeg -ss 30 -t 3 -i $1 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $2
}
# Functions
flaker ()
{
  nix flake init -t ~/.config/flake-templates#${1};
}


zstyle ':completion:*' menu select
setopt complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


bindkey "^X" kill-whole-line
bindkey -s "^[l" '. '~/.config/zsh/utils/fzfopen.sh'^M'
bindkey -s "^[z" 'cd $(zoxide query -i) ^M'
bindkey -s "^[g" 'lazygit^M'
bindkey -s "^[h" "history 0 | awk '{\$1=\"\"}1' | fzf | wl-copy^M"
bindkey -s "^[n" "nnn^M"
source ~/.config/zsh/modules.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arya/.local/share/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/arya/.local/share/conda/etc/profile.d/conda.sh" ]; then
        . "/home/arya/.local/share/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/arya/.local/share/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH=$PATH:~/.local/bin

[ -f ~/.config/zsh/work.sh ] && source ~/.config/zsh/work.sh
function killgrep() {
ps aux | grep $1 | awk '{print $2}' | xargs -I{} sudo kill {}
}

 # source "$HOME/.rye/env"
 #
