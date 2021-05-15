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
        "/home/eduardo/.local/share/chezmoi"
        "/home/eduardo/Documents"
        "/home/eduardo/Pictures"
        "/home/eduardo/Videos"
        "/home/eduardo/projects"
        "/home/eduardo/Games"
        "/home/eduardo/Templates"
        "/home/eduardo/Music"
        "/home/eduardo/bin"
        "/home/eduardo/Sync"
      ];
      prune.keep = {
        daily = 7;
        weekly = 4;
        monthly = -1;
      };
      removableDevice = true;
      repo = "/run/media/eduardo/2e571771-81db-41a5-a0b6-d5c6d3b8bf88/borg";
      startAt = "0/6:30:0";
      user = "eduardo";
    };
  };
}
