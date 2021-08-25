{ config, pkgs, ... }:
{
  imports = [
    ./pulseaudio.nix
  ];
  users.users.kiri = {
    packages = with pkgs; [ mpc_cli ncmpcpp mpdris2 pulsemixer ];
  };
}
