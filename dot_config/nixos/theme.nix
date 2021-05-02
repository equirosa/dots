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
        monospace = [ "Fira Code Nerd Font" ];
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
  home-manager.users.eduardo = { pkgs, ... }: {
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "ePapirus";
      };
      theme = {
        package = pkgs.materia-theme;
        name = "Materia-dark-compact";
      };
    };
    qt = {
      enable = true;
      platformTheme = "gtk";
    };
  };
}
