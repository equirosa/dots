{ config, ... }: {
  services = {
    borgbackup.jobs.external = {
      compression = "auto,zstd,10";
      doInit = false;
      encryption.mode = "none";
      exclude = [
        "*/league-of-legends/*"
        "*.stversion"
        "*.stfolder"
        "*/node_modules/*"
      ];
      extraPruneArgs = "--save-space";
      paths = [
        "/home/kiri/.local/share/chezmoi"
        "/home/kiri/Documents"
        "/home/kiri/Pictures"
        "/home/kiri/Videos"
        "/home/kiri/projects"
        "/home/kiri/Games"
        "/home/kiri/Templates"
        "/home/kiri/Music"
        "/home/kiri/bin"
        "/home/kiri/Sync"
      ];
      prune.keep = {
        daily = 7;
        weekly = 4;
        monthly = -1;
      };
      removableDevice = true;
      repo = "/run/media/kiri/2e571771-81db-41a5-a0b6-d5c6d3b8bf88/borg";
      startAt = "0/6:30:0";
      user = "kiri";
    };
  };
}
