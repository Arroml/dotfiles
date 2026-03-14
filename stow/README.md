# Stow packages

This directory contains GNU Stow packages that point at the canonical configs
already versioned in this repository.

Recommended packages for a new Mac:

- `git`
- `zsh`
- `nvim`
- `tmux`
- `wezterm`
- `aerospace`
- `karabiner`
- `yazi`

Example:

```bash
cd ~/dotfiles
stow -d stow git zsh nvim tmux wezterm aerospace karabiner yazi
```

Important configs covered by these packages:

- `~/.gitconfig`
- `~/.config/git`
- `~/.zshrc`
- `~/.p10k.zsh`
- `~/.config/nvim`
- `~/.config/tmux`
- `~/.config/wezterm`
- `~/.config/aerospace`
- `~/.config/karabiner`
- `~/.config/yazi`
