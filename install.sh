#!/usr/bin/env bash

set -eo pipefail

DOTFILES_ROOT=$(dirname "$(realpath "$0")")
source "$DOTFILES_ROOT"/vendor/shell-lib/lib/logging.sh
source "$DOTFILES_ROOT"/vendor/shell-lib/lib/os.sh
source "$DOTFILES_ROOT"/vendor/shell-lib/lib/utils.sh
source "$DOTFILES_ROOT"/vendor/shell-lib/lib/file.sh

dotfiles_announce() {
    echo '====================================='
    echo
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
    for DOTFILES_MODULE_DIR in "$DOTFILES_ROOT"/modules/*; do
        DOTFILES_MODULE_NAME=$(basename "$DOTFILES_MODULE_DIR")

        if utils::confirm "Install module: $DOTFILES_MODULE_NAME" || utils::is_true "$module_install_toggle"; then
            echo
            (
                source "$DOTFILES_MODULE_DIR"/setup.sh

                if ! utils::fn_defined setup; then
                    logging::error "setup() not defined in module: $DOTFILES_MODULE_NAME"
                    exit 1
                fi

                logging::info "Installing module: $DOTFILES_MODULE_NAME"

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
