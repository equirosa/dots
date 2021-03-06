{ config, pkgs, ... }: {
  imports = [
    ./global.nix
    ../hardware/cpu/amd.nix
    # ../hardware/gpu/amdgpu.nix
    ../hardware/zsa.nix
    ../virtualization/qemu.nix
  ];
  networking.hostName = "snowfort";
  zramSwap = { enable = true; };
}
