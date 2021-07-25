{ config, pkgs, ... }: {
  imports = [ ./picom.nix ];
  programs = { slock.enable = true; };
  environment = {
    shellAliases = {
      startx = "startx $XDG_CONFIG_HOME/x11/xinitrc";
    };
    sessionVariables = { };
    systemPackages = with pkgs; [
      devour
      dmenu
      rofi
      maim
      sxhkd
      xclip
      xdo
      xidlehook
      xorg.xkill
    ];
  };
  services = {
    redshift.enable = true;
    unclutter = { enable = true; };
    xserver = {
      enable = true;
      layout = "us,latam";
      xkbOptions = "grp:win_space_toggle,ctrl:nocaps";
    };
  };
}
