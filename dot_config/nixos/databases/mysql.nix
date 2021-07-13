{ config, pkgs, ... }:
{
  users.users.kiri.extraGroups = [ "mysql" ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureUsers = [
      {
        name = "desarrollo";
        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
