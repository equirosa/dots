{ config, pkgs, ... }:
{
  imports = [ ./xserver.nix ];
  home-manager.users.kiri = {
    xdg.configFile."awesome/rc.lua".source = ../../non_nix/awesome/rc.lua;
  };
  services.xserver = {
    displayManager.startx.enable = true;
    windowManager.awesome = {
      enable = true;
    };
  };
}
