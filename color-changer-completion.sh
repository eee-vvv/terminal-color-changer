#!/bin/bash

_colorscheme_completions() {
  sed -nr 's/.*: &(.*)$/\1/p' ~/.config/alacritty/alacritty.yml > /tmp/temp_color.txt
  COMPREPLY=($(compgen -W "$(cat /tmp/temp_color.txt)" -- "${COMP_WORDS[1]}"))
}

complete -F _colorscheme_completions colorscheme
