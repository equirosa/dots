{ config, pkgs, ... }: {
  home-manager.users.kiri = { pkgs, ... }: {
    programs.tmux = {
      enable = true;
      escapeTime = 0;
      baseIndex = 1;
      extraConfig = ''
        set -g focus-events on
        set-option -g mouse on
        set -sa terminal-overrides ',xterm-256color:RGB'
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"
      '';
      terminal = "screen-256color";
      newSession = true;
      shortcut = "a";
      plugins = with pkgs; [ ];
    };
  };
}
