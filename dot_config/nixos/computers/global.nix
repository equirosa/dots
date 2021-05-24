{ config, lib, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
    ../packages/all.nix
    ./hardware/audio.nix
    ./editors/neovim.nix
    ./flatpak.nix
    ./home.nix
    ./location.nix
    ./misc/cleanup.nix
    ./misc/gaming.nix
    ./security.nix
    ./shell.nix
    ./theme.nix
    ./tmux.nix
    ./tor.nix
    ./window-managers/wayland/sway.nix
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest_hardened;
    tmpOnTmpfs = true;
  };
  environment = {
    homeBinInPath = true;
    defaultPackages = [ ];
  };
  hardware.cpu.amd.updateMicrocode = true;
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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
      pulseaudio = true;
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
    ];
  };
  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
  };
  networking.firewall = {
    allowedTCPPorts = [ 8096 42000 ];
    allowedUDPPorts = [ 8096 42000 ];
  };
  services = {
    i2pd = { enable = true; };
    ipfs = { enable = true; };
    udisks2.enable = true;
    stubby.enable = true;
  };
  system.autoUpgrade = {
    enable = true;
    dates = "5:0:0";
  };
  time.timeZone = "America/Costa_Rica";
}
