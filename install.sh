#!/bin/bash

FILES=(
    #neovim
    "$HOME/Develop/dotfiles/nvim/init.vim"
    "$HOME/Develop/dotfiles/nvim/coc-settings.json"
    #emacs
    "$HOME/Develop/dotfiles/emacs/init.el"
    #alacritty
    "$HOME/Develop/dotfiles/alacritty/alacritty.yml"
    # zsh
    "$HOME/Develop/dotfiles/zsh/.zshrc"
    # lldb
    "$HOME/Develop/dotfiles/lldb/.lldbinit"
    # tmux
    "$HOME/Develop/dotfiles/tmux/.tmux.conf"
)

LINKS=(
    # neovim
    "$HOME/.config/nvim/init.vim"
    "$HOME/.config/nvim/coc-settings.json"
    # emacs
    "$HOME/.emacs.d/init.el"
    # alacritty
    "$HOME/.config/alacritty/alacritty.yml"
    # zsh
    "$HOME/.zshrc"
    # lldb
    "$HOME/.lldbinit"
    # tmux
    "$HOME/.tmux.conf"
    )

# backup
for i in ${LINKS[@]}; do
    if [[ -e "$i" ]] && [[ ! -L "$i" ]]; then
        cp "$i" "$i.bak"
        echo "Create the backup file: $i.bak"
    fi
done

# link
i=0
for file in ${FILES[@]}; do
    ln -sf "${FILES[$i]}" "${LINKS[$i]}"
    let i++
done
