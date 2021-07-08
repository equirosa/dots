{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    fade = true;
  };
}
