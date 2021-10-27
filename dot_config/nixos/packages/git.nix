{ config, pkgs, ... }: {
  home-manager.users.kiri.programs.git = {
    enable = true;
    package = pkgs.gitMinimal;
    userEmail = "eduardo@eduardoquiros.com";
    userName = "Eduardo Quirós";
    aliases = {
      co = "checkout";
      ca = "commit -a";
      pl = "pull";
      ps = "push";
      s = "status";
    };
    attributes = [ "*.pdf diff=pdf" ];
    extraConfig = {
      mergetool = {
        prompt = false;
        "nvim".cmd = "nvim -f -c \"Gdiffsplit!\" \"$MERGED\"";
      };
      pager = {
        diff = "delta";
        log = "delta";
        reflog = "delta";
        show = "delta";
      };
      pull.rebase = false;
    };
    ignores = [ "*~" "*.swp" "*.swo" "*.direnv" ];
    signing = {
      key = "03678E9642EB6D9E99974ACFB77F36C3F12720B4";
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations line-numbers";
        whitespace-error-style = "22 reverse";
      };
    };
  };
}
