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
    DOTFILES_ROOT=$(dirname "$(realpath "$0")")
    source "$DOTFILES_ROOT/functions.sh"

    for DOTFILES_MODULE_DIR in "$DOTFILES_ROOT"/modules/*; do
        DOTFILES_MODULE_NAME=$(basename "$DOTFILES_MODULE_DIR")

        if dotfiles_confirm "Install module: $DOTFILES_MODULE_NAME"; then
            echo
            (
                source "$MODULE_DIR"/SETUP

                if ! dotfiles_is_defined setup; then
                    dotfiles_print_error "setup() not defined in module: $DOTFILES_MODULE_NAME"
                    exit 1
                fi

                dotfiles_print_info "Installing module: $DOTFILES_MODULE_NAME"

                setup "$@"
            )
        else
            echo
        fi
    done
}

(
    dotfiles_announce
    dotfiles_install "$@"
)
