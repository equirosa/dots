{ config, pkgs, ... }: {
  environment = {
    shellAliases = {
      fi = "flatpak install";
      fl = "flatpak list";
      fs = "flatpak search";
      fu = "flatpak uninstall";
    };
  };
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [
        #xdg-desktop-portal-gtk
        #xdg-desktop-portal-kde
        #xdg-desktop-portal-wlr
      ];
    gtkUsePortal = true;
  };
}
