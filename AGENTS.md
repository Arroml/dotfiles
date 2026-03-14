# Repository Guidelines

## Project Structure & Module Organization
This repository stores personal dotfiles and application configuration. Root-level shell behavior lives in `.zshrc`. App-specific settings live under `.config/`: `nvim/` for Neovim, `tmux/` for tmux, `wezterm/` for WezTerm, `yazi/` for Yazi, `karabiner/` for Karabiner-Elements, and `aerospace/` for AeroSpace. Neovim is the largest module; keep shared editor logic in `.config/nvim/lua/config/` and plugin definitions in `.config/nvim/lua/config/plugins/`.

## Build, Test, and Development Commands
There is no single project build step. Validate changes with the tool that owns the config:

- `stylua .config/nvim` formats Neovim Lua files using the repo’s style rules.
- `nvim --headless '+qa'` smoke-tests that the Neovim config loads without startup errors.
- `tmux -f .config/tmux/tmux.conf start-server` checks tmux syntax against the repo config.
- `wezterm start --config-file .config/wezterm/wezterm.lua` verifies WezTerm can load the file.
- `git diff -- .zshrc .config` reviews only config changes before commit.

## Coding Style & Naming Conventions
Match the language and tool conventions already in use. For Neovim Lua, use 2-space indentation, Unix line endings, and prefer single quotes where `stylua` allows it; the canonical settings are in `.config/nvim/.stylua.toml`. Keep Lua modules lowercase and descriptive, for example `config/options.lua` or `config/plugins/telescope.lua`. Preserve each tool’s native file format: TOML for AeroSpace and Yazi, JSON for Karabiner, Lua for Neovim and WezTerm, shell syntax for `.zshrc`.

## Testing Guidelines
This repo does not include an automated test suite or coverage target. Treat validation as configuration smoke testing: format Lua, launch the affected app with the edited config, and confirm startup succeeds. When changing keybindings or shell aliases, include a short manual verification note in the PR.

## Commit & Pull Request Guidelines
Git history is minimal (`first commit`), so use short imperative commit subjects such as `Add AeroSpace workspace bindings` or `Refine Yazi theme colors`. Keep commits scoped to one tool when practical. PRs should describe the changed config, list verification commands you ran, and include screenshots only for visual tools such as WezTerm themes or Yazi styling.
Create a git commit for every repository change; do not leave finished edits uncommitted.

## Security & Configuration Tips
Do not commit secrets, machine-specific tokens, or private hostnames. Prefer environment variables or local untracked overrides for sensitive values. Remove generated backups like `theme.toml-*` unless they are intentionally versioned.
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
