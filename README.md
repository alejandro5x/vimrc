# My Vim Configuration (`.vimrc`)

This repository contains my custom Vim configuration, designed to enhance productivity and streamline development with a focus on efficiency and simplicity.

## Features

- **Vim-Plug Integration**: Easily manage your plugins with Vim-Plug, a lightweight and versatile plugin manager.
- **Custom Mappings**: Personalized keybindings to optimize navigation and editing.
- **Syntax Highlighting**: Enhanced syntax support for various programming languages.
- **Auto-completion**: Integrated auto-completion for faster coding.
- **Status Line Configuration**: Customized status line for better visibility and functionality.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/alejandro5x/vimrc.git ~/.vim
   ```

2. Install Vim-Plug:
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. Update your `.vimrc`:
   ```bash
   cp ~/.vim/.vimrc ~/
   ```

4. Install Plugins:
   Launch Vim and run:
   ```
   :PlugInstall
   ```

## Usage

Simply open Vim, and your configuration will be loaded automatically, complete with all the installed plugins and custom settings.

## Contributing

Feel free to fork this repository and make your own modifications. Contributions are welcome via pull requests.
