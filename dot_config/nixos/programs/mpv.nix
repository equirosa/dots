{ pkgs, config, ... }: {
  home-manager.users.kiri = {
    programs.mpv = {
      enable = true;
      /* config = { */
      /* }; */
    };
    xdg.configFile = {
      "mpv.conf" = {
        target = "mpv/mpv.conf";
        text = ''
          force-window=yes
          ytdl-format='bestvideo[height<=?1080]+bestaudio/best'
          script-opts=ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp
          screenshot-directory=~/Pictures/screenshots
          slang=en,eng
          save-position-on-quit
        '';
      };
    };
  };
  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv-with-scripts.override {
        extraMakeWrapperArgs = [
          "--script-opts=ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp"
        ];
        scripts = [
          self.mpvScripts.sponsorblock
          self.mpvScripts.mpv-playlistmanager
        ];
      };
    })
  ];
}
