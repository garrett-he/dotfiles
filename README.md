![dotfiles Logo](./images/dotfiles-logo.png)

# dotfiles

This repository contains a collection of configuration files (aka dot files) and
installer scripts for various utilities working in shell.

## Installation

`dotfiles` can be installed by running the following command in your terminal:

```
curl -fsSL https://raw.githubusercontent.com/garrett-he/dotfiles/main/remote-install.sh | bash
```

If you are installing through a mirror repository, you can set the environment
variable `DOTFILES_GIT_REMOTE`, then execute the command like:

```
DOTFILES_GIT_REMOTE=url/to/your/repo.git curl -fsSL https://url/to/your/repo/remote-install.sh | bash
```

Alternatively, you can clone this repository on your local machine and install
it manually:

```
git clone https://github.com/garrett-he/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/install.sh
```

## Modules

`dotfiles` modules are located in the directory `/modules` as sub-folders. And
there should be at least one file named `setup.sh` with an implementation of
function `setup()` to tell the global installer how to install this module.

The `setup.sh` can invoke all functions in `functions.sh` as well.

## Configurations

You can create a file named `config` at root directory of this repository to
tell the script how to perform installation.

The option `INSTALL_{MODULE}` is used to tell the installer whether to install
the module named `MODULE` (`1/Y/n` install, `0/N/n` skip) without confirmation.

> Essentially, configuration options are global environment variables, so you
> can also set these environment variables directly without generate `config`
> file before installation.
>
> This would be very useful for automatic `dotfiles` installation by other
> scripts.

Example:

```
# install git without confirmation
INSTALL_GIT=1

# skip vim installation
INSTALL_VIM=0
```

### Module options

Some modules can also set installation options through `/config`, which to
support automatic installation without keyboard input. Option names typically
start with `{MODULE}_`.

Available module configurations:

#### module: git

```
# git config user.name
GIT_USER_NAME=YOUR_NAME

# git config user.email
GIT_USER_EMAIL=YOUR_EMAIL

# git config init.defaultBranch
GIT_INIT_DEFAULTBRANCH=main

# git config commit.gpgsign
GIT_COMMIT_GPGSIGN=0

# git config user.signingkey
# works only if git_commit_gpgsign=1
GIT_USER_SIGNINGKEY=
```

## License

Copyright (C) 2024 Garrett HE <garrett.he@outlook.com>

The BSD 3-Clause License, see [LICENSE](./LICENSE).
