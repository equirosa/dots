{ config, pkgs, ... }: {
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [
        xdg-desktop-portal-gtk
        #xdg-desktop-portal-kde
        #xdg-desktop-portal-wlr
      ];
    gtkUsePortal = true;
  };
}
