{ pkgs, config, ... }: {
  home-manager.users.kiri = {
    programs.mpv = {
      enable = true;
    };
    xdg.configFile = {
      "mpv.conf" = {
        target = "mpv/mpv.conf";
        text = ''
          script-opts=ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp
          force-window=yes
          save-position-on-quit
          screenshot-directory=~/Pictures/screenshots
          slang=en,eng
          ytdl-format='bestvideo[height<=?1080]+bestaudio/best'
        '';
      };
    };
  };
  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv-with-scripts.override {
        /* extraMakeWrapperArgs = [ */
        /*   "--script-opts=ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp" */
        /* ]; */
        scripts = [
          self.mpvScripts.sponsorblock
          self.mpvScripts.mpv-playlistmanager
        ];
      };
    })
  ];
}
