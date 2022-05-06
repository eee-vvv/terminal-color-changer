#!/bin/bash

# A simple script to change the color schemes of my alacritty and nvim config 
# files with one command.
#
# Makes the assumption that alacritty config is at ~/.config/alacritty/alacritty.yml
# and that nvim color is set at ~/.config/nvim/color.vim

# Right now, only guaranteed compatible with Apple OS
# TODO: test on my arch machine


echo "Please pick a colorscheme from the following."
echo
echo "Enter it at the command prompt below and"
echo "press enter."
echo

# find and print all available color schemes from alacritty.yml
sed -nr 's/.*: &(.*)$/\1/p' ~/.config/alacritty/alacritty.yml | tee /tmp/temp_color.txt
echo

while true; do
  echo -n "> "
  read choice

  if grep -Fxq "$choice" /tmp/temp_color.txt
  then
    # if found, replace respective lines of alacritty.yml and color.vim
    alacritty_replacement="colors: \*$choice"
    nvim_replacement="colorscheme $choice"
    sed -i .bak "s/^colors:.*/$alacritty_replacement/" ~/.config/alacritty/alacritty.yml
    sed -i .bak "s/^colorscheme.*/$nvim_replacement/" ~/.config/nvim/color.vim
    break
  else
    echo "Choice not valid. Please try again."
  fi
done

rm /tmp/temp_color.txt
