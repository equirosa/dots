{ config, pkgs, ... }:
let
  dash = "#!${pkgs.dash}/bin/dash";
in
{
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
      ${dash}
      ${pkgs.yt-dlp}/bin/yt-dlp --sponsorblock-mark all --embed-subs --embed-metadata --restrict-filenames "$1"
    '')
    (pkgs.writeScriptBin "nixinfo" ''
      ${dash}
      information="$(nix-env -qaP --json "$1")"
      printf "$information" | ${pkgs.bat}/bin/bat -pl json
    '')
    (pkgs.writeScriptBin "destroy" ''
      ${dash}
      ${pkgs.coreutils}/bin/shred -zvu "$1"
    '')
    (pkgs.writeScriptBin "rem-lap" ''
      #!/usr/bin/env nix-shell
      #! nix-shell -i sh -p remmina
      chosen=$(find "$XDG_DATA_HOME/remmina/" -name "*.remmina")

      [ "$(${pkgs.coreutils}/bin/echo "$chosen" | ${pkgs.coreutils}/bin/wc -l
      )" -gt 1 ] && chosen=$(${pkgs.coreutils}/bin/echo "$chosen" | menu)

      remmina -c "$chosen"
    '')
    (pkgs.writeScriptBin "nix-find-root" ''
      ${dash}
      ${pkgs.coreutils}/bin/readlink -f "$(which "$1")"
    '')
    (pkgs.writeScriptBin "show-ansi-escapes" ''
      ${dash}
      for i in 30 31 32 33 34 35 36 37 38; do
        ${pkgs.coreutils}/bin/echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i);"
        done
    '')
  ];
}
