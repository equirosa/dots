{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (
      import (
        builtins.fetchTarball {
          url =
            "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
        }
      )
    )
  ];
  home-manager.users.kiri = {
    home.packages = with pkgs; [ sqlite plantuml ];
    programs.emacs = {
      enable = true;
      package = pkgs.emacsPgtkGcc;
      extraPackages = (
        epkgs:
          with epkgs; [
            ## Development
            company
            ## Nix Stuff
            envrc
            nix-mode
            # Misc.
            deadgrep
            evil
            flycheck
            flycheck-plantuml
            move-dup
            pdf-tools
            trashed
            # Org
            babel
            org-superstar
            org-evil
            org-ref
            org-roam
            org-roam-server
            plantuml-mode
            # Utilities
            undo-tree
            # Style
            all-the-icons
            all-the-icons-dired
            doom-modeline
            doom-themes
            fira-code-mode
            rainbow-delimiters
          ]
      );
    };
  };
}
