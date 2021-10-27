{ config, pkgs, ... }: {
  imports = [
    ./safe.nix
    ./insecure.nix
    ./unfree.nix
    ./git.nix
    ./mpv.nix
    ./zathura.nix
  ];
}
