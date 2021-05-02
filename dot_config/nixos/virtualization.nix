{ config, pkgs, ... }: {
  boot.extraModprobeConfig = "options kvm_amd nested=1";
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuRunAsRoot = false;
    };
    virtualbox = {
      host = {
        #enable = true;
      };
    };
  };
  users.users.eduardo = {
    extraGroups = [ "libvirtd" ];
    packages = with pkgs; [ virt-manager ];
  };
}
