{ config, ... }: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.kiri = {
      programs = {
        ssh = {
          enable = true;
          controlMaster = "auto";
          controlPersist = "10m";
          hashKnownHosts = true;
          extraConfig = ''
            Host github.com
              User git
              IdentityFile ~/.ssh/github
              IdentitiesOnly yes
              ForwardAgent no

            Host gitlab.com
              User git
              IdentityFile ~/.ssh/gitlab
              IdentitiesOnly yes
              ForwardAgent no

            Host *.sr.ht
              User git
              IdentityFile ~/.ssh/sourcehut
              IdentitiesOnly yes
              ForwardAgent no

            Host codeberg.org
              User git
              IdentityFile ~/.ssh/codeberg
              IdentitiesOnly yes
              ForwardAgent no

            Host eduardoquiros.xyz
              User kiri
              IdentityFile ~/.ssh/vultr-debian
              IdentitiesOnly yes
              ForwardAgent no

            Host eduardoquiros.xyz
              User website
              IdentityFile ~/.ssh/remote-website
              IdentitiesOnly yes
              ForwardAgent no

            Host azure.com
              User git
              IdentityFile ~/.ssh/azure-devops
              IdentitiesOnly yes
              ForwardAgent no
          '';
        };
      };
      services = {
        kdeconnect = {
          indicator = true;
        };
        mpd = {
          enable = true;
          musicDirectory = "/home/kiri/Music";
        };
        mpdris2 = {
          enable = true;
          multimediaKeys = true;
          notifications = true;
        };
        syncthing.enable = true;
        udiskie = { enable = true; };
      };
      xdg = { enable = true; };
    };
  };
}
