{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (
      import (
        builtins.fetchTarball {
          url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
        }
      )
    )
  ];
  home-manager.users.kiri = {
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      extraConfig = ''
        lua << EOF
          ${builtins.readFile /home/kiri/.config/nvim/init.lua}
        EOF
      '';
      plugins = with pkgs.vimPlugins; [
        vim-nix
      ];
    };
  };
}
