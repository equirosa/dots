{ config, pkgs, ... }: {
  services.xserver = {
    displayManager.startx.enable = true;
  };
}
