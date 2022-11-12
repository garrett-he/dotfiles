dotfiles_ostype() {
    if [[ $OSTYPE == "darwin"* ]]; then
        echo darwin
    elif [[ $OSTYPE == "linux"* ]]; then
        echo linux
    else
        echo $OSTYPE
    fi
}

dotfiles_print_error() {
    echo -e "\033[1;31m$1\033[0m" >&2
}

dotfiles_print_warning() {
    echo -e "\033[1;33m$1\033[0m"
}

dotfiles_print_info() {
    echo -e "\033[1;32m$1\033[0m"
}

dotfiles_print_debug() {
    if [[ -z $DOTFILES_DEBUG ]]; then
        return
    fi

    echo -e "\033[0;37m[debug] $1\033[0m"
}

dotfiles_read() {
    read -r -p "$(echo -e "\033[1;34m$1\033[0m: ")"
    eval "$2='$REPLY'"

    if [[ -z $REPLY ]]; then
        eval "$2=$3"
    fi
}

dotfiles_confirm() {
    read -n1 -r -p "$(echo -e "\033[1;34m$1?\033[0m [y/N]: ")"

    if [[ "$REPLY" = "y" ]] || [[ "$REPLY" = "Y" ]]; then
        return 0
    else
        return 1
    fi
}

dotfiles_is_defined() {
    declare -F "$1" > /dev/null
    return $?
}

dotfiles_is_true() {
    if [[ "$1" == "1" ]] || [[ "$1" == "Y" ]] || [[ "$1" == "y" ]]; then
        return 0
    else
        return 1
    fi
}

dotfiles_sed() {
    if [[ $OSTYPE == "darwin"* ]]; then
        /usr/bin/sed -i '' -e "$@"
    else
        sed -i "$@"
    fi
}

dotfiles_replace_text() {
    dotfiles_sed "s#$2#$3#g" "$1"
}

dotfiles_delete_line() {
    dotfiles_sed "/$2/d" "$1"
}

dotfiles_append_shell_profile() {
    if [[ -z $2 ]]; then
        for rcfile in .zshrc .bashrc; do
            echo "$1" >> "$HOME/$rcfile"
        done
    else
        echo "$1" >> "$HOME/.${2}rc"
    fi
}

dotfiles_backup_files() {
    for file in "$@"; do
        if [[ -e "$file" ]]; then
            cp -R "$file" "$file~"
        fi
    done
}
