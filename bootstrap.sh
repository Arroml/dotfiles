#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="${DOTFILES_DIR}/Brewfile"
BACKUP_ROOT="${HOME}/.dotfiles-backups"
BACKUP_DIR=""

log() {
  printf '[bootstrap] %s\n' "$*"
}

warn() {
  printf '[bootstrap] warning: %s\n' "$*" >&2
}

backup_target() {
  local target="$1"

  if [[ -L "$target" ]]; then
    rm -f "$target"
    return
  fi

  if [[ -e "$target" ]]; then
    if [[ -z "$BACKUP_DIR" ]]; then
      BACKUP_DIR="${BACKUP_ROOT}/$(date +%Y%m%d%H%M%S)"
      mkdir -p "$BACKUP_DIR"
    fi

    mkdir -p "${BACKUP_DIR}$(dirname "$target")"
    mv "$target" "${BACKUP_DIR}${target}"
    log "Moved existing ${target} to ${BACKUP_DIR}${target}"
  fi
}

link_path() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "$target")"
  backup_target "$target"
  ln -s "$source" "$target"
  log "Linked ${target} -> ${source}"
}

clone_if_missing() {
  local repo="$1"
  local target="$2"

  if [[ -d "$target/.git" ]]; then
    log "Keeping existing clone at ${target}"
    return
  fi

  mkdir -p "$(dirname "$target")"
  git clone --depth=1 "$repo" "$target"
  log "Cloned ${repo} into ${target}"
}

install_xcode_tools() {
  if xcode-select -p >/dev/null 2>&1; then
    return
  fi

  log 'Installing Xcode Command Line Tools'
  xcode-select --install || true
  until xcode-select -p >/dev/null 2>&1; do
    sleep 5
  done
}

install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    return
  fi

  log 'Installing Homebrew'
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

setup_homebrew_shellenv() {
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

install_brew_bundle() {
  log "Installing Homebrew packages from ${BREWFILE}"
  brew bundle --file="$BREWFILE"
}

install_oh_my_zsh() {
  if [[ -d "${HOME}/.oh-my-zsh" ]]; then
    return
  fi

  log 'Installing Oh My Zsh'
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_shell_plugins() {
  local custom_dir="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"

  clone_if_missing https://github.com/romkatv/powerlevel10k.git \
    "${custom_dir}/themes/powerlevel10k"
  clone_if_missing https://github.com/zsh-users/zsh-autosuggestions \
    "${custom_dir}/plugins/zsh-autosuggestions"
  clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${custom_dir}/plugins/zsh-syntax-highlighting"
}

install_tpm() {
  clone_if_missing https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
}

install_fzf_shell_integration() {
  if [[ ! -x "$(brew --prefix)/opt/fzf/install" ]]; then
    return
  fi

  log 'Installing fzf shell integration'
  "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish
}

link_dotfiles() {
  link_path "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
  link_path "${DOTFILES_DIR}/.config/git" "${HOME}/.config/git"
  link_path "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
  link_path "${DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"
  link_path "${DOTFILES_DIR}/.config/tmux" "${HOME}/.config/tmux"
  link_path "${DOTFILES_DIR}/.config/wezterm" "${HOME}/.config/wezterm"
  link_path "${DOTFILES_DIR}/.config/yazi" "${HOME}/.config/yazi"
  link_path "${DOTFILES_DIR}/.config/karabiner" "${HOME}/.config/karabiner"
  link_path "${DOTFILES_DIR}/.config/aerospace" "${HOME}/.config/aerospace"
  link_path "${DOTFILES_DIR}/.config/tmux/tmux.conf" "${HOME}/.tmux.conf"
  link_path "${DOTFILES_DIR}/.config/aerospace/aerospace.toml" "${HOME}/.aerospace.toml"

  if [[ -f "${DOTFILES_DIR}/.p10k.zsh" ]]; then
    link_path "${DOTFILES_DIR}/.p10k.zsh" "${HOME}/.p10k.zsh"
  else
    warn "No ${DOTFILES_DIR}/.p10k.zsh found; Powerlevel10k prompt config was not linked"
  fi
}

main() {
  install_xcode_tools
  install_homebrew
  setup_homebrew_shellenv
  install_brew_bundle
  install_oh_my_zsh
  install_shell_plugins
  install_tpm
  install_fzf_shell_integration
  link_dotfiles

  if [[ -n "$BACKUP_DIR" ]]; then
    log "Backed up replaced files under ${BACKUP_DIR}"
  fi

  log 'Bootstrap complete'
  log 'Manual follow-up: grant macOS permissions for AeroSpace, Karabiner, Homerow and WezTerm if prompted.'
}

main "$@"
