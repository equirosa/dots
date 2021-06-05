{ config, pkgs, ... }: {
  users.users.kiri.packages = with pkgs; [
    chiaki # PS4 Remote Play utility
    eidolon
    lutris # General games client
    legendary-gl
    taisei
  ];
  programs.steam.enable = true;
  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    pulseaudio = { support32Bit = true; };
  };
}
