#!/bin/bash

# A simple script to change the color schemes of my alacritty and nvim config files with one command

######################################################################################################
# NOTE: This script does not have robust error handling as of yet. It makes the assumption that
# your alacritty config is located at ~/.config/alacritty/alacritty.yml and that your nvim
# color scheme is set in ~/.config/nvim/color.vim AND that the name of the color scheme is the same
# in both places. A simple way to ensure this is to name the color scheme in alacritty.yml the same as
# the corresponding nvim name.
######################################################################################################

echo "Please pick a colorscheme from the following."
echo ""
echo "Enter it at the command prompt below and"
echo "press enter."
echo ""
# find and print all available color schemes from alacritty.yml
sed -nr 's/.*: &(.*)$/\1/p' ~/.config/alacritty/alacritty.yml > /tmp/temp_color.txt
cat /tmp/temp_color.txt
echo ""
echo -n "> "
read choice

if grep -Fxq "$choice" /tmp/temp_color.txt
then
  # code if found
  alacritty_replacement="colors: \*$choice"
  nvim_replacement="colorscheme $choice"
  sed -i .bak "s/^colors:.*/$alacritty_replacement/" ~/.config/alacritty/alacritty.yml
  sed -i .bak "s/^colorscheme.*/$nvim_replacement/" ~/.config/nvim/color.vim
else
  echo ""
  echo "Choice not valid. Please try again."
fi

rm /tmp/temp_color.txt
