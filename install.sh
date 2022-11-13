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

    if [[ -f "$DOTFILES_ROOT"/config ]]; then
        source "$DOTFILES_ROOT"/config
    fi

    for DOTFILES_MODULE_DIR in "$DOTFILES_ROOT"/modules/*; do
        DOTFILES_MODULE_NAME=$(basename "$DOTFILES_MODULE_DIR")

        local module_install_toggle=install_${DOTFILES_MODULE_NAME}

        if [[ -n "${!module_install_toggle}" ]]; then
            module_install_toggle="${!module_install_toggle}"
        fi

        if dotfiles_confirm "Install module: $DOTFILES_MODULE_NAME" || dotfiles_is_true "$module_install_toggle"; then
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
