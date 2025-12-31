# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git macos autojump sudo zsh-autosuggestions zsh-syntax-highlighting)




source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias f='cd "$(fd -t d . ~ | fzf)"'
alias docs='cd ~/Dokumente'
alias myip='curl ifconfig.me'
alias reload='source ~/.zshrc'
alias zshconf='nano ~/.zshrc'
alias v='nvim'
alias grep='grep --color=auto'
alias py='python3'
alias pipup=’pip list –outdated
alias proj='cd ~/Projekte'
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
eval "$(zoxide init zsh)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/qt/bin:$PATH"

# Created by `pipx` on 2025-03-01 10:58:21
export PATH="$PATH:/Users/alexanderroman/.local/bin"

bindkey -v
# Cursor für Vim-Mode (Insert = Strich | Normal = Block)
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      echo -ne "\e[1 q";;  # Block cursor
    viins|main) echo -ne "\e[5 q";;  # Beam cursor
  esac
}
zle -N zle-keymap-select
echo -ne "\e[5 q"
export KEYTIMEOUT=1

export EDITOR=nvim
export VISUAL=nvim

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

