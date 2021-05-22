{ config, pkgs, ... }: {
  hardware.keyboard.zsa.enable = true;
  users.users.kiri = {
    extraGroups = [ "plugdev" ];
    packages = with pkgs; [ wally-cli ];
  };
}
