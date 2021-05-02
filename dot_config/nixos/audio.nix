{ config, pkgs, ... }: {
  nixpkgs.config = { pulseaudio = true; };
  services = {
    #pipewire = {
    #enable = true;
    #alsa = {
    #enable = true;
    #support32Bit = true;
    #};
    #jack.enable = true;
    #pulse.enable = true;
    #};
  };
  hardware.pulseaudio = {
    enable = true;
    extraConfig =
      "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  };
  users.users.eduardo = {
    packages = with pkgs; [ mpc_cli ncmpcpp mpdris2 pulsemixer ];
  };
}
