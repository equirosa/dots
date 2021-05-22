# This file is used mostly to force XDG Desktop Specification compliance in some programs.
{ config, ... }: {
  environment = {
    shellAliases = {
      weechat = "weechat -d $XDG_CONFIG_HOME/weechat";
    };
    variables = {
      # General XDG variables
      XDG_CONFIG_HOME = "/home/kiri/.config";
      XDG_DATA_HOME = "/home/kiri/.local/share";
      XDG_CACHE_HOME = "/home/kiri/.cache";
      # Forcing compliance
      CARGO_HOME = "/home/kiri/.local/share/cargo";
      GOPATH = "/home/kiri/.local/share/go";
      HISTFILE = "/home/kiri/.cache/history";
      GTK2_RC_FILES = "/home/kiri/.config/gtk-2.0/gtkrc";
      IDEA_PROPERTIES = "/home/kiri/.config/intellij-idea/idea.properties";
      IDEA_VM_OPTIONS = "/home/kiri/.config/intellij-idea/idea64.vmoptions";
      LESSHISTFILE = "-"; # Disable less history file
      PASSWORD_STORE_DIR = "/home/kiri/.local/share/password-store";
      UNISON = "/home/kiri/.local/share/unison";
      WEECHAT_HOME = "/home/kiri/.config/weechat";
      XCOMPOSEFILE = "/home/kiri/.config/X11/xcompose";
      XCOMPOSECACHE = "/home/kiri/.cache/X11/xcompose";
      ZDOTDIR = "/home/kiri/.config/zsh";
    };
  };
}
