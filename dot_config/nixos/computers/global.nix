{ config, lib, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
    ../editors/neovim.nix
    ../editors/emacs.nix
    ../env_vars.nix
    ../flatpak.nix
    ../hardware/audio/default.nix
    ../home.nix
    ../shell.nix
    ../misc/location.nix
    ../misc/cleanup.nix
    ../misc/gaming.nix
    ../packages/all.nix
    ../theme.nix
    ../tmux.nix
    ../tor.nix
    ../graphical/xorg/awesome.nix
  ];
  environment = {
    homeBinInPath = true;
  };
  users = {
    mutableUsers = false;
    users.kiri = {
      createHome = true;
      description = "Eduardo Quiros";
      extraGroups = [ "wheel" "video" "audio" ];
      initialHashedPassword =
        "$6$IpW9o6X.83H$mYxouAAprMhh83PVbRrwRDk684.u9vfPjwXWBrpYEveIEirvlIh.IUXaoKFknetTGTq9xnKfM/bi.5pYaXLUU/";
      isNormalUser = true;
    };
  };
  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  nixpkgs = {
    config = {
      packageOverrides = pkgs: {
        nur = import
          (
            builtins.fetchTarball
              "https://github.com/nix-community/NUR/archive/master.tar.gz"
          )
          {
            inherit pkgs;
          };
      };
    };
    overlays = [
      #(import ../nixpkgs/overlays/gopass.nix)
      #(import ../nixpkgs/overlays/qutebrowser.nix)
      (self: super: {
        mpv = super.mpv-with-scripts.override {
          scripts = [ self.mpvScripts.sponsorblock ];
        };
      })
    ];
  };
  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "qt";
    };
  };
  system.autoUpgrade = {
    enable = true;
    dates = "5:0:0";
  };
  time.timeZone = "America/Costa_Rica";
}
