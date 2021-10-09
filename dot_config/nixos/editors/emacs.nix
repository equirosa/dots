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
    home.packages = with pkgs; [ sqlite ];
    services.emacs = {
      enable = true;
      client = {
        enable = true;
      };
      socketActivation.enable = true;
    };
    programs.emacs = {
      enable = true;
      package = pkgs.emacsPgtkGcc;
      extraPackages = (
        epkgs:
          with epkgs; [
            ## Development
            company
            tree-sitter
            tree-sitter-langs
            ## Nix Stuff
            envrc
            nix-mode
            # Misc.
            evil
            flycheck
            flycheck-plantuml
            move-dup
            # Org
            babel
            org-appear
            org-books
            org-superstar
            org-evil
            org-link-beautify
            org-noter
            org-ref
            org-roam
            ox-pandoc
            # Utilities
            undo-tree
            # Style
            all-the-icons
            all-the-icons-dired
            doom-modeline
            gruvbox-theme
            rainbow-delimiters
          ]
      );
    };
  };
}
