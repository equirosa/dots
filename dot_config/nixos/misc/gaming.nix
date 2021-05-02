{ config, pkgs, ... }: {
  users.users.eduardo.packages = with pkgs; [
    chiaki # PS4 Remote Play utility
    eidolon
    lutris # General games client
    legendary-gl
    mono
    wine
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
