env::shell_name() {
    basename $(readlink /proc/$$/exe)
}
