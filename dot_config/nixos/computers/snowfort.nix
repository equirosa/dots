{ config, pkgs, ... }: {
  imports = [
    ../global.nix
    ../hardware/amdgpu.nix
    ../hardware/zsa.nix
  ];
  networking.hostName = "snowfort";
  services = {
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/home" ];
    };
  };
  zramSwap = { enable = true; };
}
