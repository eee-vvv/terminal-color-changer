#!/bin/bash

# A simple script to change the color schemes of my alacritty and nvim config 
# files with one command. Gives an interactive prompt if no argument, sets
# the color scheme if there is an argument
#
# Makes the assumption that alacritty config is at ~/.config/alacritty/alacritty.yml
# and that nvim color is set at ~/.config/nvim/color.vim

# Right now, only guaranteed compatible with Apple OS
# TODO: test on my arch machine

# Check to see if argument matches list of known color schemes
check_matched () {
  if grep -Fxq "$1" /tmp/temp_color.txt; then
    return 0
  else
    return 1
  fi
}

# search alacritty.yml for schemes and output them to temp file
sed -nr 's/.*: &(.*)$/\1/p' ~/.config/alacritty/alacritty.yml > /tmp/temp_color.txt

matched=false

if [ $# -eq 1 ]; then
  if check_matched $1; then
    matched=true
    choice=$1
  else
    echo "Invalid argument supplied"
    exit 1
  fi
elif [ $# -gt 1 ]; then
  echo "Too many arguments supplied"
  exit 1
fi

echo "Please pick a colorscheme from the following."
echo
echo "Enter it at the command prompt below and"
echo "press enter."
echo

cat /tmp/temp_color.txt
echo

while [ $matched = false ]; do
  echo -n "> "
  read choice

  if check_matched $choice; then
    matched=true
  else
    echo "Choice not valid. Please try again."
  fi
done

alacritty_replacement="colors: \*$choice"
nvim_replacement="colorscheme $choice"
sed -i .bak "s/^colors:.*/$alacritty_replacement/" ~/.config/alacritty/alacritty.yml
sed -i .bak "s/^colorscheme.*/$nvim_replacement/" ~/.config/nvim/color.vim
