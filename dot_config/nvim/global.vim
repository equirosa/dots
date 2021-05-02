autocmd BufWritePost *sway/*,*waybar/*,status.toml !swaymsg reload
autocmd BufWritePre * :%s/\s\+$//e " Remove whitespace upon saving a file
"autocmd BufWritePost *,bin/* !format % " Format nix buffers before writing
map <leader>C :w! \| !pile <c-r>%<CR>

