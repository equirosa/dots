{ config, pkgs, ... }:
{
  imports = [
    ../xserver.nix
    ./global.nix
  ];
  home-manager.users.kiri = {
    xdg.configFile."awesome/rc.lua" = {
      source = ./awesome/rc.lua;
      onChange = "awesome-client 'awesome.restart()'";
    };
  };
  services.xserver = {
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs; [
        luarocks
      ];
    };
  };
}
