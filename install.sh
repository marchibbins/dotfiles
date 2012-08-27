#!/bin/bash

# Installer script to symlink dotfiles, similar to:
# https://github.com/holman/dotfiles
# https://github.com/jferris/config_files

ignore_files="install.sh readme.md"

for name in *; do
    target="$HOME/.$name"
    overwrite=0
    backup=0

    if [[ "$ignore_files" == *"$name"* ]]; then
        continue
    else
        echo -n "Install $target? (y, n): "
        read install_file
        if [ $install_file != "y" ]; then
            continue
        fi
    fi

    if [ -e "$target" ]; then
        echo -n "File already exists: '$target', what do you want to do? [s]kip, [o]verwrite, [b]ackup: "
        read option
        case $option in
            o) overwrite=1;;
            b) backup=1;;
            s) echo "- File skipped"
               continue;;
            *) echo "Command not recognised, file skipped"
               continue;;
        esac
        if [ "$overwrite" = 1 ]; then
            echo "- Removing $target"
            rm "$target"
        fi
        if [ "$backup" = 1 ]; then
            echo "- Backing up to $target.backup"
            mv "$target" "$target".backup
        fi
    fi
    if [ "$skip" != 1 ]; then
        echo "Creating $target"; echo ""
        ln -s "$PWD/$name" "$target"
    fi
done
