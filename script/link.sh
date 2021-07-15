#!/usr/bin/env bash

DOTFILES_ROOT=$(pwd)
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

set -e
echo ''

echo $DOTFILES_ROOT

fail () {
    printf "${RED}[ERROR] %s\n${ENDCOLOR}" "$1" && exit
}

link_files () {
    ln -s "$1" "$2"
    echo "> Linked $1 to $2"
}

main () {
 echo "> Making Symlinks..."

 # all files ending in `.symlink`
 symlinks=$(find "$DOTFILES_ROOT" -maxdepth 2 -name \*.symlink)   

# prep option flags to override all files
 overwrite_all=false
 backup_all=false
 skip_all=false

 for source in $symlinks; do
    # given alderaan.symlink in dotfiles dir
    # name of destination is ~/.alderaan
    dest="$HOME/.$(basename ${source%.*})"

    # check if the destination is already a file or directory
    if [ -f "$dest" ] || [ -d "$dest" ]
    then
        # prep option flags to override this file
        overwrite=false
        backup=false
        skip=false
        
        # unless we've already made an all-file decision, prompt for user's choice
        if [ "$overwrite_all" == "false" ] && [ "backup_all" == "false"] && [ "$skip_all" == "false" ]
        then
            echo "> $(basename "$source") already exists,"
            echo "> What do you want to do?"
            echo ""
            echo " [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
            read -n 1 action

            case "$action" in
                o ) overwrite=true;;
                O ) overwrite_all=true;;
                b ) backup=true;;
                B ) backup_all=true;;
                s ) skip=true;;
                S ) skip_all=true;;
                * ) ;;
            esac
        fi

        # now we act on the user choice
        if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]; then
            rm -rf "$dest"
            echo "> Removed existing $dest"
        fi

        if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]; then
            mv "$dest" "$dest"\.backup
            echo "> Moved existing $dest to $dest.backup"
        fi

        if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]; then
            link_files "$source" "$dest"
        else
            echo "> Skipping $source..."
        fi
    # here's the other branch of the conditional: here the target file doesn't exist yet
    else 
        link_files "$source" "$dest"
    fi
 done
}

main
echo ""
echo "${GREEN}[SUCCESS] Dotfiles Linked${ENDCOLOR}"