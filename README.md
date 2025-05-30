# dotfiles

Clone this repository and run the appropriate `bootstrap.*` script.

## Extra (manual) setup

These are optional tasks that I may or may not want to do, so I don't want to script them, but I'm documenting so that I can remember them.

### General

- [Install fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Install Go](https://go.dev/doc/install)
- [Install Node.js](https://nodejs.org/en)
  - [Install PNPM](https://pnpm.io/installation)
- [Install Python](https://www.python.org/)
- [Install Rust](https://www.rust-lang.org/learn/get-started)
- Import/setup GPG key
- Import [GitHub's GPG key](https://github.com/web-flow.gpg)
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
  - [Install `lazy.nvim`](https://lazy.folke.io/installation)
- [Install GitHub CLI](https://github.com/cli/cli)
  - Add `mislav/gh-license` extension
- [Install VS Code](https://code.visualstudio.com/)
- Install [WezTerm](https://github.com/wez/wezterm)

#### Fonts

- [Maple Mono](https://github.com/subframe7536/maple-font)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads):
  - CaskaydiaCove
  - Monaspice (see [monaspace docs](https://monaspace.githubnext.com/))
  - Victor Mono

```shell
git config --global commit.gpgSign true
git config --global core.editor nvim
git config --global core.cleanup scissors
git config --global diff.mnemonicPrefix true
git config --global grep.lineNumber true
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global rebase.autoSquash true
git config --global tag.gpgSign true
```

#### APT Packages (`sudo apt install`)

- `7zip`
- `bsdgames` (includes the handy program `wtf`)
- `cmake`
- `colortest`
- `dos2unix`
- `git-extras`
- `highlight`
- `jq`
- [`lsd`](https://github.com/lsd-rs/lsd)
- `pass`
- `ranger`
- `ruby`
- `ruby-dev`
- `tig`

#### Cargo Crates (`cargo install [--locked]`)

- `gengo-bin`
- `onefetch`
- `viu`
- [`yazi-fm` and `yazi-cli`](https://yazi-rs.github.io/docs/installation) (click link for other installation methods and optional dependencies)

#### Go Modules (`go install`)

- [`https://github.com/gokcehan/lf`](https://github.com/gokcehan/lf)
- [`github.com/boyter/scc/v3@latest`](https://github.com/boyter/scc)
- [`github.com/spenserblack/nf-cli@latest`](https://github.com/spenserblack/nf-cli)

#### NPM Packages (`npm install -g` or `pnpm add -g`)

- [`cspell`](https://github.com/streetsidesoftware/cspell)
- `iroiro`
- `serve`
- `write-good`

#### Ruby Gems (`gem install`)

- [`github-linguist`](https://github.com/github-linguist/linguist)
- [`repl_type_completor`](https://github.com/ruby/repl_type_completor/)

### Linux

- [Install Docker Engine](https://docs.docker.com/engine/install/)
- [Install direnv](https://direnv.net/)
- [Install `textimg`](https://github.com/jiro4989/textimg)

### Windows

- Install [AutoHotkey](https://www.autohotkey.com/)
- Install WSL
- [Install Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
- [Install PowerShell](https://github.com/powershell/PowerShell)
