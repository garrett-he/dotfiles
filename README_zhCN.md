![Banner](./images/banner.png)

# dotfiles

[English](./README.md)

此代码库包含用于在 shell 中各种实用程序的配置文件及安装程序。

## 安装

可以通过在终端中运行以下命令来安装 `dotfiles`：

```
curl -fsSL https://raw.githubusercontent.com/garrett-he/dotfiles/main/remote-install.sh | bash
```

如果是通过镜像存储库进行安装，则可以先设置环境变量 `DOTFILES_GIT_REMOTE`
，然后执行上述命令：

```
DOTFILES_GIT_REMOTE=url/to/your/repo.git curl -fsSL https://url/to/your/repo/remote-install.sh | bash
```

或者，你也可以在将此代码库克隆到本地并手动安装：

```
git clone https://github.com/garrett-he/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/install.sh
```

## 模块

`dotfiles` 的模块作为子文件夹位于目录 `/modules` 中。其应该至少有一个名为 `setup.sh`
的文件，并实现名为 `setup()` 的函数，来告诉全局安装程序如何安装这个模块。

模块的 `setup.sh` 也可以调用 `functions.sh` 中的所有函数。

## 配置

你可以在此代码库的根目录下创建一个名为 `config` 的文件，来告诉脚本如何执行安装。
选项 `INSTALL_{MODULE}` 用于告诉安装程序是否安装名为 `MODULE` 的模块（`1/Y/n`
安装，`0/N/n` 跳过）。

> 从本质上讲，配置选项就是全局环境变量，因此你也可以在安装前直接设置这些环境变量，
> 而不用生成 `config` 文件。
> 这对于通过其他脚本来自动安装 `dotfiles` 非常有用。

示例：

```
# 无需确认安装 git 模块
INSTALL_GIT=1

# 跳过安装 vim 模块
INSTALL_VIM=0
```

### 模块选项

一些模块还可以通过 `/config`
设置安装参数用于支持无需键盘输入的自动安装。选项名称通常以 `MODULE` 开头。

可用的模块配置：

#### 模块：git

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

The MIT License, see [LICENSE](./LICENSE).
