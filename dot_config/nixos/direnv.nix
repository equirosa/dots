{ pkgs, ... }: {
  home-manager.users.kiri.programs = {
    direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };
  };
  environment = {
    pathsToLink = [ "/share/nix-direnv" ];
    systemPackages = with pkgs; [ nix-direnv ];
  };
  # nix options for derivations to persist garbage collection
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
  nixpkgs.overlays = [
    (self: super: {
      nix-direnv = super.nix-direnv.override {
        enableFlakes = true;
      };
    })
  ];
}
