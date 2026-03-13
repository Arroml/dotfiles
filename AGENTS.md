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
