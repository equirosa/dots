{ config, pkgs, ... }: {
  imports = [
    ./global.nix
    ../hardware/gpu/amdgpu.nix
    ../hardware/cpu/amd.nix
    ../hardware/zsa.nix
  ];
  networking.hostName = "snowfort";
  zramSwap = { enable = true; };
}
