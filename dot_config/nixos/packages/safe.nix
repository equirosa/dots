{ config, pkgs, ... }: {
  users.users.kiri.packages = with pkgs; [
    #### Browsers ####
    firefox
    monolith
    newsboat # RSS Feed reader
    nyxt # Another badass web browser
    tor-browser-bundle-bin
    w3m # Lightweight cli web browser

    #### Comms ####
    aerc # Mail reader
    signal-desktop

    #### Dev Stuff ####
    delta
    gitMinimal
    lazygit

    #### File Management ####
    archiver
    dragon-drop # Drag and drop so I don't use another FM to drag and drop.
    ffmpegthumbnailer
    ffmpeg-full
    lf # Terminal file manager
    xplr
    pistol #Previewer
    poppler_utils
    trash-cli # Trash files

    #### File Transfer ####
    croc # Sync file transfer
    ffsend # Async file transfer
    transmission # Torrent client
    tremc # Transmission frontend TUI

    #### Nixpkgs stuff
    nox # YAY but for nixpkgs intead of AUR

    # Formatters
    nixpkgs-fmt
    shfmt

    # LSPs
    efm-langserver
    rnix-lsp

    # Pictures
    imv # Image viewer
    timg # Terminal Image viewer

    #### Document ####
    ispell # spellchecking
    pandoc
    texlive.combined.scheme-full # LaTeX stuff

    #### Utilities ####
    age
    bc
    bottom
    chezmoi
    cryfs
    czkawka
    gopass # Password Manager
    gopass-jsonapi
    jq
    kitty
    libnotify # Notification stuff
    tealdeer
    udiskie # Disk auto-mount utility
    xdg_utils

    #### Rust Replacements
    bat # Cat replacement
    du-dust # du replacement
    exa # ls replacement
    fd # replacement for 'find'
    ripgrep # grep replacement

    # Scripts
    (pkgs.writeScriptBin "sp" ''
      #!/usr/bin/env nix-shell
      #! nix-shell -i sh -p speedtest-cli
      exec speedtest
    '')
    (pkgs.writeScriptBin "dlp" ''
      #!/usr/bin/env nix-shell
      #! nix-shell -i sh --packages yt-dlp
      yt-dlp --sponsorblock-mark all --embed-subs --embed-metadata --restrict-filenames "$1"
    '')
    (pkgs.writeScriptBin "nixinfo" ''
      #!/usr/bin/env sh
      information="$(nix-env -qaP --json "$1")"
      printf "$information" | ${pkgs.bat}/bin/bat -pl json
    '')
    (pkgs.writeScriptBin "destroy" ''
      #!/bin/sh
      shred -zvu "$1"
    '')
    (pkgs.writeScriptBin "rem-lap" ''
      #!/usr/bin/env nix-shell
      #! nix-shell -i sh -p remmina
      chosen=$(find "$XDG_DATA_HOME/remmina/" -name "*.remmina")

      [ "$(echo "$chosen" | wc -l )" -gt 1 ] && chosen=$(echo "$chosen" | menu)

      remmina -c "$chosen"
    '')
    (pkgs.writeScriptBin "nix-find-root" ''
      #!/bin/sh
      readlink -f "$(which "$1")"
    '')
    (pkgs.writeScriptBin "show-ansi-escapes" ''
      for (( i = 30; i < 38; i++ )); do
        echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i);"
        done
    '')
  ];
}
