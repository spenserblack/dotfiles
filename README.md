# dotfiles

## New environment setup

These are optional tasks that I may or may not want to do, so I don't want to script them, but I'm documenting so that I can remember them.

### General

- [Install Go](https://go.dev/doc/install)
- [Install Node.js](https://nodejs.org/en)
  - [Install PNPM](https://pnpm.io/installation)
  - Add packages `iroiro serve write-good`
- [Install Python](https://www.python.org/)
- [Install Rust](https://www.rust-lang.org/learn/get-started)
- Import/setup GPG key
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
  - [Install `lazy.nvim`](https://lazy.folke.io/installation)
- [Install GitHub CLI](https://github.com/cli/cli)
  - Add `mislav/gh-license` extension
- [Install VS Code](https://code.visualstudio.com/)
- [Install scc](https://github.com/boyter/scc)

```shell
git config --global core.editor nvim
git config --global core.cleanup scissors
git config --global grep.lineNumber true
git config --global commit.gpgSign true
git config --global tag.gpgSign true
```

#### NPM Packages

- `iroiro`
- `serve`
- `write-good`

### Linux

- [Install Docker Engine](https://docs.docker.com/engine/install/)
- [Install direnv](https://direnv.net/)
- [Install `textimg`](https://github.com/jiro4989/textimg)

#### Ubuntu

```shell
apt install bsdgames cmake colortest dos2unix pass tig
# desktop
apt install oneko
# WSL
apt install wslu
```

### Windows

- Install WSL
- [Install Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
- [Install PowerShell](https://github.com/powershell/PowerShell)
