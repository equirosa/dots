{ config, pkgs, ... }: {
  users.users.kiri.extraGroups = [ "vboxusers" ];
  virtualisation.virtualbox.host.enable = true;
}
