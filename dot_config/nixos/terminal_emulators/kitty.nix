{ pkgs, ... }:
{
  home-manager.users.kiri.programs =
    let
      aliases = {
        icat = "kitty +kitten icat";
      };
    in
    {
      zsh.shellGlobalAliases = aliases;
      kitty = {
        enable = true;
        extraConfig = "
        # Fonts
        font_size 14

        # Colorscheme
        background_opacity 0.8

        foreground #ebdbb2
        background #000

        # Normal Colours
        color0 #282828
        color1 #cc241d
        color2 #98971a
        color3 #d79921
        color4 #458588
        color5 #b16286
        color6 #689d6a
        color7 #a89984

        # Bright Colours
        color8 #928374
        color9 #fb4934
        color10 #b8bb26
        color11 #fabd2f
        color12 #83a598
        color13 #d3869b
        color14 #8ec07c
        color15 #ebdbb2

        # Tab Bar
        tab_bar_style powerline

        # Active Tab
        active_tab_foreground   #000
        active_tab_background   #b8bb26
        active_tab_font_style   bold-italic
        inactive_tab_foreground #eee
        inactive_tab_background #458588
      ";
      };
    };
}
