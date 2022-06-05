#!/bin/bash

# Script to add autocompletion functionality to colorscheme script. Source it
# in you .bashrc or .zshrc file, or in /etc/bash_completion.d/

_colorscheme_completions() {
  sed -nr 's/.*: &(.*)$/\1/p' ~/.config/alacritty/alacritty.yml > /tmp/temp_color.txt
  COMPREPLY=($(compgen -W "$(cat /tmp/temp_color.txt)" -- "${COMP_WORDS[1]}"))
}

complete -F _colorscheme_completions colorscheme
