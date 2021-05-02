{ config, ... }: {
  security = {
    chromiumSuidSandbox.enable = true;
    doas = {
      enable = true;
      extraConfig = "permit eduardo as root";
      extraRules = [ { keepEnv = true; } ];
    };
    unprivilegedUsernsClone = true;
  };
}
