{ config, ... }: {
  security = {
    chromiumSuidSandbox.enable = true;
    doas = {
      enable = true;
      extraConfig = "permit kiri as root";
      extraRules = [ { keepEnv = true; } ];
    };
    unprivilegedUsernsClone = true;
  };
}
