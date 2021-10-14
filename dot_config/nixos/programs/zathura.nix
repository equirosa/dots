{ config, pkgs, ... }: {
  home-manager.users.kiri.programs.zathura = {
    enable = true;
    extraConfig = ''
      # Adjusting the document
      map [normal] E adjust_window best-fit
      map [fullscreen] E adjust_window best-fit
      map [normal] e adjust_window width
      map [fullscreen] e adjust_window width

      # Toggling the inverted colours
      map <C-i> recolor
    '';
    options = {
      adjust-open = "width";
      selection-clipboard = "clipboard";
      window-title-basename = "true";
    };
  };
}
