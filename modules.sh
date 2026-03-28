m () {
  ARG1=$1
  ARG2=$2
  # echo $ARG1 $ARG2
  if [[ $ARG1 == "a" ]]; then
    # echo Activating $ARG2
    source ~/.config/zsh/modules/$ARG2 activate
    elif [[ $ARG1 == "d" ]]; then
    # echo Deactivating $ARG2
    source ~/.config/zsh/modules/$ARG2 deactivate
  elif [[ $ARG1 == "i" ]]; then
    ~/.config/zsh/modules/$ARG2 install
    else
    echo "Usage: m [a|d] [module]"
    fi
}
