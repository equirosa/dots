{ config, pkgs, ... }: {
  environment.variables = {
    OPENER = "xdg-open";
    XDGOPEN = "${pkgs.xdg_utils}/bin/xdg-open";
    TERMINAL = "${pkgs.kitty}/bin/kitty";
    TERMIMG = "${pkgs.timg}/bin/timg";
    BAT_THEME = "gruvbox-dark";
    CALC = "${pkgs.bc}/bin/bc";
    MONITOR = "btm";
    BROWSER = "${pkgs.firefox}/bin/firefox";
    GEMBROWSER = "${pkgs.amfora}/bin/amfora";
    TERMBROWSER = "${pkgs.w3m}/bin/w3m";
    EDITOR = "nvim";
    FILE = "${pkgs.lf}/bin/lf";
    IMG = "${pkgs.imv}/bin/imv";
    MAIL = "${pkgs.torsocks}/bin/torsocks ${pkgs.aerc}/bin/aerc";
    MUSIC = "${pkgs.ncmpcpp}/bin/ncmpcpp";
    PAGER = "${pkgs.bat}/bin/bat --plain --paging always";
    READER = "${pkgs.zathura}/bin/zathura";
    LF_ICONS =
      "di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.cpp=ﭱ:*.js=:*.vimrc=:*.vim=:*.nix=:*.css=:*.pdf=:*.html=:*.rs=:*.rlib=:*.7z=:*.zip=:*.xz=:*.*z*=:*.tar=:*.lz=:*.zst=:*.zstd=:*.git=:*.webm=:*.mp4=:*.flac=:*.ogg=:*.opus=:*.m4a=:*.deb=:*.rpm=:*.py=:*.md=:*.json=ﬥ :*.mkv=:*.go=:.git=:*.ts=ﯤ:*.xml=謹:*.drawio=謹:*.lua=";
    PREVIEWER = "${pkgs.pistol}/bin/pistol";

    # Java
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

    # 'Less' stuff
    LESS = "-R";
    LESS_TERMCAP_mb = "$(tput bold; tput setaf 2)";
    LESS_TERMCAP_md = "$(tput bold; tput setaf 6)";
    LESS_TERMCAP_me = "$(tput sgr0)";
    LESS_TERMCAP_so = "$(tput bold; tput setaf 16; tput setab 14)";
    LESS_TERMCAP_se = "$(tput rmso; tput sgr0)";
    LESS_TERMCAP_us = "$(tput smul; tput bold; tput setaf 4)";
    LESS_TERMCAP_ue = "$(tput rmul; tput sgr0)";
    LESS_TERMCAP_mr = "$(tput rev)";
    LESS_TERMCAP_mh = "$(tput dim)";
    LESS_TERMCAP_ZN = "$(tput ssubm)";
    LESS_TERMCAP_ZV = "$(tput rsubm)";
    LESS_TERMCAP_ZO = "$(tput ssupm)";
    LESS_TERMCAP_ZW = "$(tput rsupm)";
    # LESS_TERMCAP_mb = "$(printf '%b' '[1;31m')";
    # LESS_TERMCAP_md = "$(printf '%b' '[1;36m')";
    # LESS_TERMCAP_me = "$(printf '%b' '[0m')";
    # LESS_TERMCAP_so = "$(printf '%b' '[01;44;33m')";
    # LESS_TERMCAP_se = "$(printf '%b' '[0m')";
    # LESS_TERMCAP_us = "$(printf '%b' '[1;32m')";
    # LESS_TERMCAP_ue = "$(printf '%b' '[0m')";

    # Pistol
    PISTOL_CHROMA_FORMATTER = "terminal16m";
    PISTOL_CHROMA_STYLE = "monokai";
  };
}
