{ config, pkgs, ... }: {
  imports = [
    ../global.nix
    ../amdgpu.nix
  ];
  networking = { hostName = "snowfort"; };
  services = {
    btrfs.autoScrub = {
      # enable = true;
      fileSystems = [ "/home" ];
    };
  };
  zramSwap = { enable = true; };
}
