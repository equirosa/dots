{ config, pkgs, ... }: {
  home-manager.users.kiri = {
    programs = {
      fish = {
        enable = true;
        shellAbbrs = { };
        interactiveShellInit = ''
          any-nix-shell fish --info-right | source
        '';
        plugins = [
          {
            name = "bang-bang";
            src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "plugin-bang-bang";
              rev = "f969c618301163273d0a03d002614d9a81952c1e";
              sha256 = "1r3d4wgdylnc857j08lbdscqbm9lxbm1wqzbkqz1jf8bgq2rvk03";
            };
          }
          {
            name = "done";
            src = pkgs.fetchFromGitHub {
              owner = "franciscolourenco";
              repo = "done";
              rev = "1.16.2";
              sha256 = "08f103y0d71gfh6x3h8lwv269vhfkwmc9bahd321r2zwrvkz0xav";
            };
          }
          {
            name = "pisces";
            src = pkgs.fetchFromGitHub {
              owner = "laughedelic";
              repo = "pisces";
              rev = "v0.7.0";
              sha256 = "073wb83qcn0hfkywjcly64k6pf0d7z5nxxwls5sa80jdwchvd2rs";
            };
          }
        ];
      };
    };
  };
}
