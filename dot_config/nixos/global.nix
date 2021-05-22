{ config, lib, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
    ./hardware/audio.nix
    ./editors/neovim.nix
    ./flatpak.nix
    ./home.nix
    ./location.nix
    ./misc/cleanup.nix
    ./misc/gaming.nix
    ./packages/unfree.nix
    ./printing.nix
    ./security.nix
    ./shell.nix
    ./theme.nix
    ./tmux.nix
    ./tor.nix
    ./virtualization.nix
    ./window-managers/wayland/sway.nix
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest_hardened;
    tmpOnTmpfs = true;
  };
  environment = {
    homeBinInPath = true;
    defaultPackages = [];
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
      packages = with pkgs; [
        #### Browsers ####
        amfora
        firefox
        newsboat # RSS Feed reader
        nyxt # Another badass web browser
        qutebrowser
        w3m # Lightweight cli web browser

        #### Comms ####
        aerc # Mail reader
        dino # XMPP client
        discord
        mumble # Cool voice chat
        toot # Mastodon client
        tut # Mastodon client
        weechat # IRC + other protocols

        #### Dev Stuff ####
        gibo # Generate ignore boilerplates
        gitMinimal
        lazygit
        licensor

        #### File Management ####
        archiver
        dragon-drop # Drag and drop so I don't use another FM to drag and drop.
        ffmpegthumbnailer
        ffmpeg-full
        highlight # Prettify the rest
        lf # Terminal file manager
        poppler_utils
        trash-cli # Trash files
        zathura # PDF Reader

        #### File Transfer ####
        cinnamon.warpinator
        croc # Sync file transfer
        ffsend # Async file transfer
        onionshare # Tor file transfer
        syncthing
        transmission # Torrent client
        tremc # Transmission frontend TUI

        #### Nixpkgs stuff
        nix-prefetch-git # get Git repo metadata
        nix-prefetch-github # get GitHub repo metadata
        nixpkgs-review
        nox # YAY but for nixpkgs intead of AUR

        # Formatters
        black
        luaformatter
        nixpkgs-fmt
        shfmt

        # LSPs
        rnix-lsp
        sumneko-lua-language-server

        # Pictures
        imv # Image viewer
        swappy # quick image editing
        viu # Terminal Image viewer

        # Media Playback
        mpv
        pypy # Necessary for umpv script to work
        youtube-dl # Video downloading utility

        #### Document ####
        ispell # spellchecking
        libreoffice-fresh # For office documents
        pandoc
        texlive.combined.scheme-full # LaTeX stuff

        #### Utilities ####
        age
        any-nix-shell
        autotiling
        bc
        bottom
        chezmoi
        cryfs
        czkawka
        freerdp
        gopass # Password Manager
        gopass-jsonapi
        libnotify # Notification stuff
        rofi
        speedtest-cli
        tealdeer
        udiskie # Disk auto-mount utility
        xdg_utils

        #### Rust Replacements
        bat # Cat replacement
        du-dust # du replacement
        exa # ls replacement
        fd # replacement for 'find'
        ripgrep # grep replacement
      ];
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
