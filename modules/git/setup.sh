setup() {
    utils::read '[git] user.name' GIT_USER_NAME
    utils::read '[git] user.email' GIT_USER_EMAIL
    utils::read '[git] init.defaultBranch' GIT_INIT_DEFAULTBRANCH main

    install -m 0600 -b "$DOTFILES_MODULE_DIR"/gitconfig.template ~/.gitconfig

    file::replace_text ~/.gitconfig DOTFILES_MODULE_DIR "$DOTFILES_MODULE_DIR"
    file::replace_text ~/.gitconfig GIT_USER_NAME "$GIT_USER_NAME"
    file::replace_text ~/.gitconfig GIT_USER_EMAIL "$GIT_USER_EMAIL"
    file::replace_text ~/.gitconfig GIT_INIT_DEFAULTBRANCH "$GIT_INIT_DEFAULTBRANCH"

    if utils::confirm '[git] commit.gpgsign' GIT_COMMIT_GPGSIGN; then
        echo
        utils::read '[git] user.signingkey' GIT_USER_SIGNINGKEY
        file::replace_text ~/.gitconfig GIT_USER_SIGNINGKEY "$GIT_USER_SIGNINGKEY"
        file::replace_text ~/.gitconfig GIT_COMMIT_GPGSIGN 'true'
    else
        echo
        file::delete_line ~/.gitconfig GIT_USER_SIGNINGKEY
        file::replace_text ~/.gitconfig GIT_COMMIT_GPGSIGN 'false'
    fi
}
