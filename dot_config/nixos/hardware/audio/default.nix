{config, pkgs, ...}:
{
  imports = [
    ./pipewire.nix
  ];
  users.users.kiri = {
    packages = with pkgs; [ mpc_cli ncmpcpp mpdris2 pulsemixer ];
  };
}
