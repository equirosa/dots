{ config, pkgs, ... }: {
  services = {
    tor = {
      enable = true;
      client = { enable = true; };
      relay = {
        enable = true;
        role = "relay";
      };
      settings = { ORPort = 143; };
      torsocks.enable = true;
    };
    privoxy = {
      enable = true;
      enableTor = true;
    };
  };
}
