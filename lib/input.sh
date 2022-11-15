set -eu

input::read() {
    if [[ $(env::shell_name) == 'bash' ]]; then
        read -r -p "$(echo -e "\033[1;104m$1\033[0m: ")"
    else
        read -r "?$(echo -e "\033[1;104m$1\033[0m: ")"
    fi

    eval "$2='$REPLY'"

    if [[ -z $REPLY ]] && [[ -n ${3:+x} ]]; then
        eval "$2=$3"
    fi
}

input::confirm() {
    if [[ $(env::shell_name) == 'bash' ]]; then
        read -r -p "$(echo -e "\033[1;104m$1?\033[0m [y/N]: ")"
    else
        read -r "?$(echo -e "\033[1;104m$1?\033[0m [y/N]: ")"
    fi

    if [[ "$REPLY" == 'y' ]] || [[ "$REPLY" == 'Y' ]]; then
        return 0
    else
        return 1
    fi
}
