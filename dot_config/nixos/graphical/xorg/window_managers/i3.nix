{ config, pkgs, ... }: {
  imports = [
    ../xserver.nix
    ./global.nix
  ];
  services.xserver = {
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [ hsetroot i3status-rust ];
      };
    };
  };
}
