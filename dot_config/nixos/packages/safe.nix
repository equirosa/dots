{ config, pkgs, ... }: {
  users.users.kiri.packages = with pkgs; [
    #### Browsers ####
    /* amfora */
    firefox
    newsboat # RSS Feed reader
    /* nyxt # Another badass web browser */
    tor-browser-bundle-bin
    /* qutebrowser */
    w3m # Lightweight cli web browser

    #### Comms ####
    aerc # Mail reader
    /* dino # XMPP client */
    /* mumble # Cool voice chat */
    signal-desktop
    /* toot # Mastodon client */
    /* tut # Mastodon client */
    /* weechat # IRC + other protocols */

    #### Dev Stuff ####
    delta
    /* gibo # Generate ignore boilerplates */
    gitMinimal
    lazygit
    /* licensor */

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
    zathura # PDF Reader

    #### File Transfer ####
    cinnamon.warpinator
    croc # Sync file transfer
    ffsend # Async file transfer
    # onionshare # Tor file transfer
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

    # Media Playback
    mpv
    youtube-dl # Video downloading utility

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
    neuron-notes
    /* remmina */
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
  ];
}
