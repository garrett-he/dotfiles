setup() {
    local ostype

    ostype=$(os::type)

    for shell_name in zsh bash; do
        file::backup "$HOME/.${shell_name}rc"
        utils::append_profiles "source $DOTFILES_MODULE_DIR/${shell_name}_profile" "$shell_name"
    done

    utils::append_profiles "source $DOTFILES_MODULE_DIR/profile"

    if [[ -f "$DOTFILES_MODULE_DIR/${ostype}_profile" ]]; then
        utils::append_profiles "source $DOTFILES_MODULE_DIR/${ostype}_profile"
    fi
}
