{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ nix-direnv ];
  # nix options for derivations to persist garbage collection
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
  environment.pathsToLink = [ "/share/nix-direnv" ];
}
