setup() {
    file::backup ~/.vimrc ~/.vim

    ln -sf "$DOTFILES_MODULE_DIR/vimrc" ~/.vimrc
    ln -sf "$DOTFILES_MODULE_DIR/vim" ~/.vim
}
