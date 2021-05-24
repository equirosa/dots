{ config, pkgs, ... }: {
  imports = [
    ./safe.nix
    ./insecure.nix
    ./unfree.nix
  ];
}
