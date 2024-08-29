#!/usr/bin/env zsh

ARG1=$1
ARG2=$2
[ -d  ~/.cache/zsh/$ARG1 ] || git clone --depth=1 $ARG2 ~/.cache/zsh/$ARG1
