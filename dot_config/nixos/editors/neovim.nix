{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
      };
    })
  ];
  users.users.kiri.packages = with pkgs; [
    neovim
  ];
}
