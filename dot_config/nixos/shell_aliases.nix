{ config, ... }: {
  environment = {
    shellAliases = {
      # General
      c = "cd";
      cat = "bat -p";
      dg = "dragon -a -x";
      k9 = "kill -9";
      l = "exa -l --icons";
      ll = "exa -la --icons";
      lt = "exa -T";
      md = "mkdir -p";
      p = "gopass";
      pg = "ps aux | egrep --color";
      rm = "rm -i";
      t = "tremc";
      v = "$EDITOR";
      wl = "watchlist";
      x = "xdg-open";
      # Chezmoi
      ch = "chezmoi";
      cha = "chezmoi add";
      chap = "chezmoi apply";
      chc = "chezmoi cd";
      chd = "chezmoi diff";
      che = "chezmoi edit --apply";
      chf = "chezmoi forget";
      chm = "chezmoi managed";
      chr = "chezmoi remove";
      chra = "chezmoi re-add";
      chu = "chezmoi unmanaged";
      # CryFS
      cf = "cryfs";
      cfu = "cryfs-unmount";
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
      nodep = "nix-env -f '<nixpkgs>' -qaP -A nodePackages";
      nba = "nix-build -A";
      neq = "nix-env -q";
      nup = "sudo nixos-rebuild switch --upgrade";
      npg = "nix-prefetch-git";
      npgh = "nix-prefetch-github";
      nre = "sudo nixos-rebuild switch --fast";
      nrw = "nix-shell -p nixpkgs-review --run 'nixpkgs-review wip'";
      ns = "nix search nixpkgs";
      ni = "nixinfo";
      nin = "nixinstall";
      ne = "nix-env -e";
      nr = "nix run";
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
      tp = "trash-put";
    };
  };
}
