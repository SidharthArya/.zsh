alias plugins=~/.config/zsh/plugins.sh

# List of plugins
# plugins powerlevel10k https://github.com/romkatv/powerlevel10k.git
plugins zsh-autsuggestions https://github.com/zsh-users/zsh-autosuggestions 

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/.cache/zsh/powerlevel10k/powerlevel10k.zsh-theme 
source ~/.cache/zsh/zsh-autsuggestions/zsh-autosuggestions.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Direnv
eval "$(direnv hook zsh)"
# Zoxide
alias source_modules='source ~/.config/zsh/modules.sh'
source_modules
eval "$(zoxide init zsh)"
alias nnn='m a nnn; nnn -x -g'
alias tmux='tmux -u'
alias ps='grc --colour=on ps'
alias zen=~/.local/opt/zen/zen
alias hm='home-manager'
alias ls='eza --icons'
alias l='eza --icons'
alias less='less -r'
alias lg='lazygit'
alias flake='nix flake'
alias code='code --ozone-platform=wayland'
alias cd='z'
# Functions
t_convertvidtogif () {
  ffmpeg -ss 30 -t 3 -i $1 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $2
}

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

export PATH=$PATH:~/.local/bin

[ -f ~/.config/zsh/work.sh ] && source ~/.config/zsh/work.sh

function killgrep() {
ps aux | grep $1 | awk '{print $2}' | xargs -I{} sudo kill {}
}

# . "$HOME/.local/share/../bin/env"

# opencode
export PATH=/home/arya/.opencode/bin:$PATH


export WINEPREFIX=~/Windows

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/zsh/starship.toml

