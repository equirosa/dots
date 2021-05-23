{ config, pkgs, ... }: {
  imports = [
    ./global.nix
    ../hardware/amdgpu.nix
    ../hardware/zsa.nix
  ];
  networking.hostName = "snowfort";
  zramSwap = { enable = true; };
}
