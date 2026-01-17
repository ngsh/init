# Init

Dev environment setup for macOS.

## Pre-requisites

```bash
# Install Homebrew packages
brew bundle install

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Vim plugins (run inside vim)
:PlugInstall
```

## Configs

| File | Description |
|------|-------------|
| `.zshrc` | NVM auto-switch, git prompt, zsh plugins |
| `.vimrc` | vim-plug, fzf, git integration, syntax highlighting |
| `.gitconfig` | Git settings |

### Key Homebrew dependencies

- `nvm` — Node version manager
- `zsh-autosuggestions` — Command suggestions
- `zsh-syntax-highlighting` — Syntax colors in terminal
- `fzf` — Fuzzy finder (used by Vim)
- `ripgrep` — Fast search (used by fzf.vim)

## Update Brewfile

```bash
brew bundle dump --force
```
