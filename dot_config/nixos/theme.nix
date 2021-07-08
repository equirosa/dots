{ config, pkgs, ... }: {
  qt5 = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
  gtk.iconCache.enable = true;
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Fira Code Nerd Font" "Twitter Color Emoji" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
    fontDir.enable = true;
    fonts = with pkgs; [
      dejavu_fonts
      emacs-all-the-icons-fonts
      fira-code-symbols
      font-awesome
      nerdfonts
      twitter-color-emoji
    ];
  };
  home-manager.users.kiri = { pkgs, ... }: {
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      theme = {
        package = pkgs.materia-theme;
        name = "Materia-dark-compact";
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    qt = {
      enable = true;
      platformTheme = "gnome";
      style = {
        package = pkgs.materia-kde-theme;
        name = "Materia-dark-compact";
      };
    };
  };
}
