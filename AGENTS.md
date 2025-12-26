# Repository Guidelines

## Project Structure & Module Organization
This repo is a dotfiles collection. Key locations:
- `.zshrc`: shell configuration and aliases.
- `.config/nvim/`: Neovim configuration (Lua under `lua/config/` and `lua/config/plugins/`).
- `.config/tmux/`: tmux configuration (`tmux.conf`) and plugin checkouts under `plugins/`.
- `.config/wezterm/`: WezTerm config (`wezterm.lua`).
- `.config/karabiner/`: Karabiner config (`karabiner.json`) plus `automatic_backups/` (generated).
- `.config/yazi/`: Yazi file manager config and themes.

## Build, Test, and Development Commands
There is no build or test pipeline at the repo root. Configs are consumed directly by their apps. Helpful commands:
- `tmux source-file ~/.config/tmux/tmux.conf`: reload tmux after changes.
- `nvim`: launch Neovim using this config (no build step required).

## Coding Style & Naming Conventions
- Lua configs use StyLua with 2-space indentation and 160-column width (see `.config/nvim/.stylua.toml`).
- Keep config filenames lowercase and aligned with their tool or plugin name (for example, `lua/config/plugins/treesitter.lua`).
- Prefer small, focused config files over monolithic ones; follow existing layout.

## Testing Guidelines
No repo-level tests are defined. If you update vendored plugins under `.config/tmux/plugins/`, follow their upstream test instructions if needed.

## Commit & Pull Request Guidelines
- Commit messages in history are short and lowercase (examples: `conf`, `weiter`); keep messages concise and direct.
- PRs should include a short summary, list affected tools (for example, `nvim`, `tmux`), and call out any vendored plugin updates.

## Configuration & Safety Notes
- Avoid manual edits in `.config/karabiner/automatic_backups/`; these files are generated.
- The `.config/tmux/plugins/` tree includes third-party checkouts with their own `.git` metadata; treat them as vendored unless intentionally updating.
