{ config, pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  users.users.kiri.shell = pkgs.zsh;
  programs.zsh.enable = true;
  /* programs.fish.enable = true; */
  home-manager.users.kiri = {
    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        autocd = true;
        dotDir = ".config/zsh";
        history = { path = ".local/share/zsh/zsh_history"; };
        initExtra = ''
          ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin
        '';
        loginExtra = ''
          if [ "$(tty)" = "/dev/tty1" ]; then exec sway || startx fi
        '';
        plugins = [
          {
            name = "zsh-syntax-highlighting";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-syntax-highlighting";
              rev = "0.7.1";
              sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
            };
          }
        ];
        shellAliases = {
          # General
          c = "cd";
          cf = "cryfs";
          cfu = "cryfs-unmount";
          ch = "chezmoi";
          cha = "chezmoi add";
          chap = "chezmoi apply";
          chc = "chezmoi cd";
          chd = "chezmoi diff";
          che = "chezmoi edit --apply";
          chf = "chezmoi forget";
          chm = "chezmoi managed";
          chu = "chezmoi unmanaged";
          cat = "bat -p";
          dg = "dragon -a -x";
          yd = "youtube-dl";
          k9 = "kill -9";
          l = "exa -l --icons";
          ll = "exa -la --icons";
          lt = "exa -T";
          md = "mkdir -p";
          p = "gopass";
          pg = "ps aux | egrep --color";
          rm = "rm -i";
          s = "speedtest";
          t = "tremc";
          wl = "watchlist";
          x = "xdg-open";
          # Editor stuff
          v = "$EDITOR";
          # Flatpak
          fi = "flatpak install";
          fl = "flatpak list";
          fs = "flatpak search";
          fu = "flatpak uninstall";
          # Git
          g = "git";
          gc = "git commit -a";
          gcp = "git commit -a; git push";
          gch = "git checkout";
          gha = "git-hydra push";
          gpl = "git pull";
          gps = "git push";
          gpsu = "git push -u origin main";
          ups = "git pull upstream master; git push";
          lg = "torsocks lazygit";
          # Nix Stuff
          elpa = "nix-env -f '<nixpkgs>' -qaP -A emacsPackages.elpaPackages";
          melpa = "nix-env -f '<nixpkgs>' -qaP -A emacsPackages.melpaPackages";
          nba = "nix-build -A";
          nup = "sudo nixos-rebuild switch --upgrade";
          npg = "nix-prefetch-git";
          npgh = "nix-prefetch-github";
          nre = "sudo nixos-rebuild switch --fast";
          nrw = "nix-shell -p nixpkgs-review --run 'nixpkgs-review wip'";
          ns = "nix search";
          ni = "nixinfo";
          nin = "nixinstall";
          ne = "nix-env -e";
          nsp = "nix-shell -p";
          nj = "nix-env -qaP --json";
          nx = "nix-env -qaP --description";
          # Tmux
          ta = "tmux a -t";
          tk = "tmux kill-session -t";
          tl = "tmux ls";
          tn = "tmux new -s";
          # Trash
          te = "trash-empty";
          tr = "trash-restore";

        };
      };
      fish = {
        /* enable = true; */
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
      direnv = {
        enable = true;
        enableNixDirenvIntegration = true;
      };
      fzf = {
        enable = true;
        changeDirWidgetCommand = "${pkgs.fd}/bin/fd -uu --type d";
        defaultCommand = "${pkgs.fd}/bin/fd -uu --type f";
        fileWidgetCommand = "${pkgs.fd}/bin/fd -uu --type f";
      };
      starship.enable = true;
      keychain = {
        enable = true;
        agents = [ "ssh" ];
        inheritType = "local";
        keys = [
          "sourcehut"
          "github"
          "gitlab"
          "codeberg"
          "azure-devops"
          "vultr-debian"
        ];
      };
      zoxide = { enable = true; };
    };
  };
}
