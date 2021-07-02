{ config, ... }:
{
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    extraConfig =
      "load-module module-native-protocol-tcp auth-p-acl=127.0.0.1";
  };
  nixpkgs.config.pulseaudio = true;
}
