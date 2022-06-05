# Color Changer

This is a simple bash script for changing my color schemes in both my Alacritty and NeoVim config files. Right now, it is in a very simple state, and not very robust to being used by others. In the future, I plan to add some simple error handling and make the find and replace operations more robust, as well as making it more portable.

For now, it makes the following assumptions:
- you are on a unix-like machine
- your alacritty config file is at `~/.config/alacritty/alacritty.yml`
- your nvim config color scheme is set at `~/.config/nvim/color.vim`

There is also a completion script that will add tab autocompletion to the command; to test it out, `source` it.
To make it permanent, add it to your `.bashrc` or `.zshrc`, or to `etc/bash_completion.d/`
