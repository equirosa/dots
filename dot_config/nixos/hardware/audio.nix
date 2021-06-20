{ config, pkgs, ... }: {
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };
  };
  users.users.kiri = {
    packages = with pkgs; [ mpc_cli ncmpcpp mpdris2 pulsemixer ];
  };
}
