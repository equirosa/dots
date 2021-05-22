{ config, pkgs, ... }: {
  hardware.keyboard.zsa.enable = true;
  users.users.kiri.packages = with pkgs; [ wally-cli ];
}
