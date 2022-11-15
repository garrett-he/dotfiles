env::shell_name() {
    basename $(readlink /proc/$$/exe)
}

env::ostype() {
    if [[ $OSTYPE == "darwin"* ]]; then
        echo darwin
    elif [[ $OSTYPE == "linux"* ]]; then
        echo linux
    else
        echo $OSTYPE
    fi
}
