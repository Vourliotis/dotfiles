# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Zsh options
setopt autocd extendedglob nomatch notify
bindkey -v

# Completion setup
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit || true  # Proceed silently if compinit fails

# Load custom environment variables and aliases
[[ -f "$HOME/.zsh_env" ]] && source "$HOME/.zsh_env"
[[ -f "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# Prepend Nix profile data directory to XDG_DATA_DIRS if it exists
[ -d "$HOME/.nix-profile/share/applications" ] && \
  export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"

# Allow unfree nix packages
export NIXPKGS_ALLOW_UNFREE=1

# FZF
FZF_LOCATIONS=(
  "$HOME/.nix-profile/share/fzf"
  "/usr/share/doc/fzf/examples"
)

for FZF_DIR in "${FZF_LOCATIONS[@]}"; do
  if [ -d "$FZF_DIR" ]; then
    [ -f "$FZF_DIR/key-bindings.zsh" ] && source "$FZF_DIR/key-bindings.zsh"
    [ -f "$FZF_DIR/completion.zsh" ] && source "$FZF_DIR/completion.zsh"
    break
  fi
done

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv >/dev/null 2>&1 && {
  eval "$(rbenv init - zsh)"
}

# Go
[ -d "/usr/local/go/bin" ] && export PATH=$PATH:/usr/local/go/bin

# nvm
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.nvm}"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Starship prompt
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# Aliases
alias home='cd ~'
alias dotfiles='cd ~/dotfiles'
alias vimconf='cd ~/.config/nvim'
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias l='eza -F'
alias gb='git branch'
alias gca='git commit --amend --no-edit --allow-empty-message'
alias gs='git status'
alias gfr='git fetch origin --prune && git reset --hard @{u} && git clean -f -d'
alias fix='git commit --fixup'
alias chbr='git checkout $(git branch | fzf --height 40% --layout reverse | tr -d "*[:space:]|+[:space:]")'
alias dbr='git branch -D $(git branch | fzf --height 40% --layout reverse | tr -d "*[:space:]|+[:space:]")'
alias lg='lazygit'
alias wname='xprop | grep WM_CLASS'
alias auau='sudo apt update && sudo apt upgrade'
