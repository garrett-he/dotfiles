![Logo](./logo/dotfiles.png)

# dotfiles

This repository contains a collection of configuration files (aka dot files) and
installer scripts for various utilities working in shell.

## Installation

`dotfiles` can be installed by running the following command in your terminal:

```
$ curl -fsSL https://raw.githubusercontent.com/garrett-he/dotfiles/main/remote-install.sh | bash
```

If you are installing through a mirror repository, you can set the environment
variable `DOTFILES_GIT_REMOTE`, then execute the command like:

```
$ DOTFILES_GIT_REMOTE=url/to/your/repo.git curl -fsSL https://url/to/your/repo/remote-install.sh | bash
```

Alternatively, you can clone this repository on your local machine and install
it manually:

```
$ git clone https://github.com/garrett-he/dotfiles.git ~/.dotfiles
$ bash ~/.dotfiles/install.sh
```

## Modules

`dotfiles` modules are located in the directory `/modules` as sub-folders. And
there should be at least one file named `SETUP` with an implementation of
function `setup()` to tell the global installer how to install this module.

The `SETUP` can invoke all functions in `functions.sh` as well.

## License

Copyright (C) 2022 Garrett HE <garrett.he@hotmail.com>

The BSD 3-Clause License, see [LICENSE](./LICENSE).
