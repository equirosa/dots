{ config, pkgs, ... }: {
  imports = [
    ./safe.nix
    ./insecure.nix
    ./unfree.nix
    ./mpv.nix
    ./zathura.nix
  ];
}
