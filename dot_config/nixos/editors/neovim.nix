{ config, pkgs, ... }: {
  home-manager.users.kiri.programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      lua << EOF
      require('plugins')
      require('settings')
      require('mappings')
      require('theme')
      EOF
    '';
  };
}
