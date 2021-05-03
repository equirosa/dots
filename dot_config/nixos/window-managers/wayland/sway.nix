{ config, pkgs, ... }: {
  home-manager.users.eduardo = { pkgs, ... }: {
    programs = {
      mako = {
        enable = true;
        defaultTimeout = 5000;
      };
    };
  };
  nixpkgs.config = { wayland = true; };
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        #libsixel
        brightnessctl
        foot
        gammastep # Control Red Hue
        i3-wk-switch
        i3status-rust
        nwg-launchers
        qt5.qtwayland # QT compat
        swayidle
        swaylock
        wf-recorder # screen video capture
        wl-clipboard # clipboard
        xwayland # Xorg compat
        # screenshots
        grim
        jq
        slurp # define screen geometry
        sway-contrib.grimshot # screenshot utility
      ];
      extraSessionCommands = ''
        export TERMINAL=foot
        export XDG_SESSION_TYPE=wayland
        export XDG_CURRENT_DESKTOP=sway
        export SDL_VIDEODRIVER=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
        export QT_QPA_PLATFORM=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
        systemctl --user import-environment
      '';
      wrapperFeatures = {
        base = true;
        gtk = true;
      };
    };
  };
  services = { pipewire.enable = true; };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
}
