#!/bin/bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exports needed here for aliases to source correctly
# My scripts
export MY_SCRIPTS_DIR="${HOME}/scripts"
# My dotfiles package
export DOTFILES_PACKAGE_DIR="${HOME}/workspace/dotfiles"

# Source of Config files under 'zshrc'
ZSHRC_DIR="${HOME}/.zsh_config"
for DIR in ${ZSHRC_DIR}/*; do
  source ${DIR}/Config
done

# Source out-of-git env variables:
source ~/.private_env

# Auto-start tmux
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi
