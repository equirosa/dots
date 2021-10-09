{ config, pkgs, ... }: {
  boot.extraModprobeConfig = "options kvm_amd nested=1";
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuPackage = pkgs.qemu_kvm;
      qemuRunAsRoot = false;
    };
  };
  programs.dconf.enable = true;
  users.users.kiri = {
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [ virt-manager ];
  };
}
