{ config, lib, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
    ../programs/all.nix
    ../direnv.nix
    ../editors/emacs.nix
    ../editors/neovim.nix
    ../env_vars.nix
    ../flameshot.nix
    ../flatpak.nix
    ../graphical/xorg/window_managers/awesome.nix
    ../graphical/wayland/sway.nix
    ../hardware/audio/default.nix
    ../home.nix
    ../misc/cleanup.nix
    ../misc/gaming.nix
    ../misc/location.nix
    ../nix.nix
    ../packages/all.nix
    ../shell.nix
    ../theme.nix
    ../terminal_emulators/kitty.nix
    ../tmux.nix
    ../tor.nix
  ];
  environment = {
    homeBinInPath = true;
    shellAliases = { };
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
  networking = {
    hostFiles = [
      "${pkgs.stevenblack-blocklist}/hosts"
      "${pkgs.stevenblack-blocklist}/alternates/gambling/hosts"
    ];
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
          scripts = [
            self.mpvScripts.sponsorblock
            self.mpvScripts.mpv-playlistmanager
          ];
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
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        sources.public-resolvers = {
          urls = [ "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md" ];
          cache_file = "public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 72;
        };
      };
    };
  };
  system.autoUpgrade = {
    enable = true;
    dates = "5:0:0";
  };
  time.timeZone = "America/Costa_Rica";
}
