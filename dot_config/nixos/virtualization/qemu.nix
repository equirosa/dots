{ config, pkgs, ... }: {
  boot.extraModprobeConfig = "options kvm_amd nested=1";
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuRunAsRoot = false;
    };
  };
  users.users.kiri = {
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [ virt-manager ];
  };
}
