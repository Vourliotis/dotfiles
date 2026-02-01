alias home='cd ~'
alias dotfiles='cd ~/dotfiles'
alias vimconf='cd ~/.config/nvim'
alias notes='cd ~/Obsidian/nvim/'
alias gb='git branch'
alias gs='git status'
alias gca='git commit --amend --no-edit --allow-empty-message'
alias fix='git commit --fixup'
alias lg='lazygit'

function gfr
    git fetch origin --prune && git reset --hard @{u} && git clean -f -d
end

function chbr
    git checkout (git branch | fzf --height 40% --layout reverse | tr -d "*[:space:]|+[:space:]")
end

function dbr
    git branch -D (git branch | fzf --height 40% --layout reverse | tr -d "*[:space:]|+[:space:]")
end
