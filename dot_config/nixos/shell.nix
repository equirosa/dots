{ config, pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  users.users.kiri.shell = pkgs.fish;
  #programs.zsh.enable = true;
  programs.fish.enable = true;
  home-manager.users.kiri = {
    programs = {
      zsh = {
        enableAutosuggestions = true;
        enableCompletion = true;
        autocd = true;
        dotDir = ".config/zsh";
        history = { path = ".local/share/zsh/zsh_history"; };
        initExtra = ''
          any-nix-shell zsh --info-right | source /dev/stdin
          [ "$(tty)" = "/dev/tty1" ] && exec sway
        '';
        plugins = [
          {
            name = "zsh-syntax-highlighting";
            src = pkgs.fetchFromGitHub {
              owner = "zsh-users";
              repo = "zsh-syntax-highlighting";
              rev = "0.7.1";
              sha256 = "039g3n59drk818ylcyvkciv8k9mf739cv6v4vis1h9fv9whbcmwl";
            };
          }
        ];
        shellAliases = {};
      };
      fish = {
        enable = true;
        shellAbbrs = {
          # General
          c = "cd";
          cf = "cryfs";
          cfu = "cryfs-unmount";
          cha = "chezmoi add";
          chap = "chezmoi apply";
          chc = "chezmoi cd";
          chd = "chezmoi diff";
          che = "chezmoi edit --apply";
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
        interactiveShellInit = ''
          any-nix-shell fish --info-right | source
        '';
        plugins = [
          {
            name = "bang-bang";
            src = pkgs.fetchFromGitHub {
              owner = "oh-my-fish";
              repo = "plugin-bang-bang";
              rev = "d45ae216969fa5c3eac0b6248119e8a1da56fe89";
              sha256 = "0jpcs8fpw9a69ai6mwhgikw77j03fhnixcl21yx1b5p65333pddc";
            };
          }
          {
            name = "done";
            src = pkgs.fetchFromGitHub {
              owner = "franciscolourenco";
              repo = "done";
              rev = "1.14.10";
              sha256 = "1fn4q2clm0n9agb9f2vx1zj3g785kfjyyfdr2w3zzmsjaa8kcxqr";
            };
          }
          {
            name = "pisces";
            src = pkgs.fetchFromGitHub {
              owner = "laughedelic";
              repo = "pisces";
              rev = "v0.6.0";
              sha256 = "075nhd90r8cdc8l7viw9cb2cksg82xqz29y3bld2zyx8lcanqlwd";
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
