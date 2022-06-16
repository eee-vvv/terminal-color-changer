# Color Changer

Color Changer is a simple bash script for changing my color schemes in both my Alacritty and Neovim config files simultaneously. It includes a script for tab autocompletion. If passed an argument which is a valid color scheme, it will make the changes to the relevant config files. If not, it will initiate an interactive prompt with a list of all available color schemes.

## Assumptions

Color Changer makes some assumptions about your environment:

- You are on a Mac or BSD machine (the `sed` command differs slightly on Linux—a cross-compatible version is in the works).
- Your Alacritty config file is at `~/.config/alacritty/alacritty.yml`
- Your Neovim color scheme is set at `~/.config/nvim/color.vim`
    ```vim
    " ~/.config/nvim/color.vim (sourced in init.vim)
    
    colorscheme ayu
    ```
- In your Alacritty config file, your color schemes are saved using `&` to alias each scheme.
    ```yml
    # ~/.config/alacritty/alacritty.yml

    ayu: &ayu
      primary:
        background: '#1f2430'
        foreground: '#cbccc6'
        bright_foreground: '#f28779'

      normal:
        black:   '#212733'
        red:     '#f08778'
        green:   '#53bf97'
        yellow:  '#fdcc60'
        blue:    '#60b8d6' 
        magenta: '#ec7171'
        cyan:    '#98e6ca'
        white:   '#fafafa'

      bright:
        black: '#686868'
        red: '#f58c7d'
        green: '#58c49c'
        yellow: '#ffd165'
        blue: '#65bddb'
        magenta: '#f17676'
        cyan: '#9debcf'
        white: '#ffffff'

    colors: *ayu
    ```
- Each Alacritty alias matches the name of the same colorscheme in your Neovim config.

If any of these are not true, the scripts are well-documented and can be easily altered to meet your needs.

## Using the script

```bash
git clone https://github.com/eee-vvv/terminal-color-changer.git
cd terminal-color-changer
# source autocompletion script
source ./_color_changer_completion
# run command with interactive prompt
./color-changer
# run command with argument
./color-changer ayu
```

If you enter an invalid argument or too many arguments, the script will not make any changes to your config files and will alert you to your mistake. If you enter an invalid scheme at the interactive prompt, you will be prompted to try again.
