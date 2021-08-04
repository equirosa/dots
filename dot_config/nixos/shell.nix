{ config, pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  users.users.kiri.shell = pkgs.zsh;
  programs.zsh.enable = true;
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
          source ${pkgs.zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh
          source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
        '';
        plugins = [
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
          wally = "wally-cli";
          wl = "watchlist";
          x = "xdg-open";
          # Editor stuff
          v = "$EDITOR";
          # Flatpak
          fi = "flatpak install";
          fl = "flatpak list";
          fs = "flatpak search";
          fun = "flatpak uninstall";
          fup = "flatpak update";
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
      fzf = {
        enable = true;
        changeDirWidgetCommand = "${pkgs.fd}/bin/fd -uu --type d";
        changeDirWidgetOptions = [ "--preview 'exa -1 --icons {}'" ];
        defaultCommand = "${pkgs.fd}/bin/fd -uu --type f";
        fileWidgetCommand = "${pkgs.fd}/bin/fd -uu --type f";
        fileWidgetOptions = [ "--preview 'pistol {}'" ];
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
