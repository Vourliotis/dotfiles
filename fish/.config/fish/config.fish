source /usr/share/cachyos-fish-config/cachyos-config.fish

# Disable fastfetch system info on shell startup
function fish_greeting
end

set -gx EDITOR nvim
set -gx SUDO_EDITOR "nvim -u $HOME/.config/nvim/init.lua"
set -gx FZF_DEFAULT_OPTS '--color=pointer:#B5BD68'

fish_add_path ~/.local/bin
fzf_key_bindings
mise activate fish | source
starship init fish | source
zoxide init --cmd cd fish | source
