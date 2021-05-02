{ config, pkgs, ... }: {
  imports = [ ./xserver.nix ];
  services.xserver = {
    displayManager.startx.enable = true;
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [ hsetroot i3status-rust ];
      };
    };
  };
}
