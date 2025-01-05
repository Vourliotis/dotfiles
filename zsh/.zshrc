HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
zstyle :compinstall filename '/home/xvourliotis/.zshrc'
autoload -Uz compinit
compinit

# Prepend Nix profile data directory to XDG_DATA_DIRS if it exists.
if [ -d "$HOME/.nix-profile/share/applications" ]; then
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
fi

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
eval "$(rbenv init - zsh)"

# Go
export PATH=$PATH:/usr/local/go/bin

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Starship prompt
eval "$(starship init zsh)"

# Aliases
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias l='eza -F'
alias vimconf='cd ~/.config/nvim'
alias gb='git branch'
alias gca='git commit --amend --no-edit --allow-empty-message'
alias gs='git status'
alias gfr='git fetch origin --prune && git reset --hard @{u} && git clean -f -d'
alias fix='git commit --fixup'
alias chbr='git checkout $(git branch | fzf --height 40% --layout reverse | rt -d "*[:space:]|+[:space:]")'
alias lg='lazygit'
