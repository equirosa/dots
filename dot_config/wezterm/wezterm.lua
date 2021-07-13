local wezterm = require 'wezterm';
return {
    color_scheme = "Gruvbox Dark",
    font = wezterm.font_with_fallback({"FiraCode Nerd Font"}),
    font_size = 14.0,
    harfbuzz_features = {"calt=1", "clig=1", "liga=1"},
    window_background_opacity = 0.8
}
