# dotfiles

Clone this repository and run the appropriate `bootstrap.*` script.

## Manual setup

These are optional tasks that I may or may not want to do, so I don't want to script them, but I'm documenting so that I can remember them.

### General

- [Install fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Install Go](https://go.dev/doc/install)
- [Install Node.js](https://nodejs.org/en)
  - [Install PNPM](https://pnpm.io/installation)
- [Install Python](https://www.python.org/)
- [Install Rust](https://www.rust-lang.org/learn/get-started)
- Import/setup GPG key
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
  - [Install `lazy.nvim`](https://lazy.folke.io/installation)
- [Install GitHub CLI](https://github.com/cli/cli)
  - Add `mislav/gh-license` extension
- [Install VS Code](https://code.visualstudio.com/)
- Import [GitHub's GPG key](https://github.com/web-flow.gpg)
- Install [A Nerd Font](https://www.nerdfonts.com/font-downloads)
  - CaskaydiaCove
  - Monaspice (see [monaspace docs](https://monaspace.githubnext.com/))
- Install [wezterm](https://github.com/wez/wezterm)

```shell
git config --global commit.gpgSign true
git config --global core.editor nvim
git config --global core.cleanup scissors
git config --global diff.mnemonicPrefix true
git config --global grep.lineNumber true
git config --global push.autoSetupRemote true
git config --global rebase.autoSquash true
git config --global tag.gpgSign true
```

#### APT Packages (`sudo apt install`)

- `bsdgames` (includes the handy program `wtf`)
- `cmake`
- `colortest`
- `dos2unix`
- `git-extras`
- `highlight`
- `jq`
- `pass`
- `ranger`
- `ruby`
- `ruby-dev`
- `tig`

##### Desktop

- `oneko`

##### WSL

- `wslu`

#### Cargo Crates (`cargo install [--locked]`)

- `gengo-bin`
- `onefetch`
- `viu`

#### Go Modules (`go install`)

- [`github.com/boyter/scc/v3@latest`](https://github.com/boyter/scc) (click link for other installation methods)

#### NPM Packages (`npm install -g` or `pnpm add -g`)

- `iroiro`
- `serve`
- `write-good`

#### Ruby Gems (`gem install`)

- [`github-linguist`](https://github.com/github-linguist/linguist)
- [`katakata_irb`](https://github.com/tompng/katakata_irb)

### Linux

- [Install Docker Engine](https://docs.docker.com/engine/install/)
- [Install direnv](https://direnv.net/)
- [Install `textimg`](https://github.com/jiro4989/textimg)

### Windows

- Install [AutoHotkey](https://www.autohotkey.com/)
- Install WSL
- [Install Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
- [Install PowerShell](https://github.com/powershell/PowerShell)
