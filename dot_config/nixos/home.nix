{ config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    users.kiri = { pkgs, ... }: {
      home = {
        sessionVariables = {
          PATH = "$HOME/bin:$PATH";
          OPENER = "xdg-open";
          XDGOPEN = "${pkgs.xdg_utils}/bin/xdg-open";
          #TERMINAL = "${pkgs.alacritty}/bin/alacritty";
          TERMIMG = "${pkgs.viu}/bin/viu";
          CALC = "${pkgs.bc}/bin/bc";
          MONITOR = "btm";
          BROWSER = "${pkgs.firefox}/bin/firefox";
          GEMBROWSER = "${pkgs.amfora}/bin/amfora";
          TERMBROWSER = "w3m";
          EDITOR = "nvim";
          FILE = "${pkgs.lf}/bin/lf";
          IMG = "${pkgs.imv}/bin/imv";
          MAIL = "${pkgs.torsocks}/bin/torsocks ${pkgs.aerc}/bin/aerc";
          MUSIC = "${pkgs.ncmpcpp}/bin/ncmpcpp";
          READER = "${pkgs.zathura}/bin/zathura";
          LF_ICONS =
            "di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.cpp=ﭱ:*.js=:*.vimrc=:*.vim=:*.nix=:*.css=:*.pdf=:*.html=:*.rs=:*.rlib=:*.7z=:*.zip=:*.xz=:*.*z*=:*.tar=:*.lz=:*.zst=:*.zstd=:*.git=:*.webm=:*.mp4=:*.flac=:*.ogg=:*.opus=:*.m4a=:*.deb=:*.rpm=:*.py=:*.md=:*.json=ﬥ :*.mkv=:*.go=:.git=:*.ts=ﯤ:*.xml=謹:*.drawio=謹";

          # Java
          _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

          # 'Less' stuff
          LESS = "-R";
          LESS_TERMCAP_mb = "$(printf '%b' '[1;31m')";
          LESS_TERMCAP_md = "$(printf '%b' '[1;36m')";
          LESS_TERMCAP_me = "$(printf '%b' '[0m')";
          LESS_TERMCAP_so = "$(printf '%b' '[01;44;33m')";
          LESS_TERMCAP_se = "$(printf '%b' '[0m')";
          LESS_TERMCAP_us = "$(printf '%b' '[1;32m')";
          LESS_TERMCAP_ue = "$(printf '%b' '[0m')";
        };
      };
      programs = {
        ssh = {
          enable = true;
          controlMaster = "auto";
          controlPersist = "10m";
          hashKnownHosts = true;
          extraConfig = ''
            Host github.com
              User git
              IdentityFile ~/.ssh/github
              IdentitiesOnly yes
              ForwardAgent no

            Host gitlab.com
              User git
              IdentityFile ~/.ssh/gitlab
              IdentitiesOnly yes
              ForwardAgent no

            Host *.sr.ht
              User git
              IdentityFile ~/.ssh/sourcehut
              IdentitiesOnly yes
              ForwardAgent no

            Host codeberg.org
              User git
              IdentityFile ~/.ssh/codeberg
              IdentitiesOnly yes
              ForwardAgent no

            Host eduardoquiros.xyz
              User kiri
              IdentityFile ~/.ssh/vultr-debian
              IdentitiesOnly yes
              ForwardAgent no

            Host eduardoquiros.xyz
              User website
              IdentityFile ~/.ssh/remote-website
              IdentitiesOnly yes
              ForwardAgent no

            Host azure.com
              User git
              IdentityFile ~/.ssh/azure-devops
              IdentitiesOnly yes
              ForwardAgent no
          '';
        };
      };
      services = {
        kdeconnect = {
          enable = true;
          indicator = true;
        };
        mpd = {
          enable = true;
          musicDirectory = "/home/kiri/Music";
          extraConfig = ''
            audio_output {
            type "pulse"
            name "Pulseaudio"
            server "127.0.0.1"
            }
          '';
        };
        mpdris2 = {
          enable = true;
          multimediaKeys = true;
          notifications = true;
        };
        syncthing.enable = true;
        udiskie = { enable = true; };
      };
      xdg = { enable = true; };
    };
  };
}
