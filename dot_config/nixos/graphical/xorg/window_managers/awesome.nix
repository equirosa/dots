{ config, pkgs, ... }:
{
  imports = [
    ../xserver.nix
    ./global.nix
  ];
  services.xserver = {
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs; [
        luarocks
      ];
    };
  };
}
