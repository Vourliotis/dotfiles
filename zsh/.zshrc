# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/xvourliotis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Source
source ~/.xprofile
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh_aliases

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Go
export PATH=$PATH:/usr/local/go/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship prompt
eval "$(starship init zsh)"

# Disable Spring
export DISABLE_SPRING=true
export BG_MIGRATIONS=true
