{ config, ... }: {
  users.users.kiri.packages = with pkgs; [
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
}
