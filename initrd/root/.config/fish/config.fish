#!/usr/bin/fish
#source original bashrc file with bass
bass source ~/.bashrc
##STANDARD FISH / TERMINAL SETTINGS##########################
set -gx EDITOR 'nano'
set -gx PYTHON python3.11
##HISTORY SETTINGS###########################################
set -gx HISTFILESIZE 900000
set -gx HISTSIZE 900000
set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTCONTROL "erasedups:ignoreboth"
#FISH THEME SETTINGS#########################################
SKIM_DEFAULT_COMMAND=sk -m -x --ansi -i -c 'rg --color=always --line-number "{}"' | xargs -n1 nano 
#FISH ALIAS ###########ADD -S TO SAVE AS FUNCTIONS########################
#TO LAUNCH FZF INTO A TEMUX PANE https://github.com/PatrickF1/fzf.fish/wiki/Cookbook
#function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
#  if set --query TMUX
#    fzf-tmux $argv
#  else
#    command fzf $argv
#  end