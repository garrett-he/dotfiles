#!/usr/bin/env bash

set -eo pipefail

dotfiles_announce() {
    echo '====================================='
    echo '      _       _    __ _ _            '
    echo '     | |     | |  / _(_) |           '
    echo '   __| | ___ | |_| |_ _| | ___  ___  '
    echo '  / _` |/ _ \| __|  _| | |/ _ \/ __| '
    echo ' | (_| | (_) | |_| | | | |  __/\__ \ '
    echo '  \__,_|\___/ \__|_| |_|_|\___||___/ '
    echo
    echo '====================================='
    echo
    echo 'A collection of configuration files for various'
    echo 'utilities working in shell.'
    echo
}

dotfiles_install() {
    dotfiles_root=$(dirname "$(realpath "$0")")
    source "$dotfiles_root/functions.sh"

    for MODULE_DIR in "$dotfiles_root"/modules/*; do
        module_name=$(basename "$MODULE_DIR")

        if dotfiles_confirm "Install module: $module_name"; then
            echo
            (
                source "$MODULE_DIR"/SETUP

                if ! dotfiles_is_defined setup; then
                    dotfiles_print_error "setup() not defined in module: $module_name"
                    exit 1
                fi

                dotfiles_print_info "Installing module: $module_name"

                setup "$@"
            )
        fi
    done
}

(
    dotfiles_announce
    dotfiles_install "$@"
)
