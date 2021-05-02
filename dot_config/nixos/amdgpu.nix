{ config, pkgs, ... }: {
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdpgu" ];
  hardware.opengl = {
    extraPackages = with pkgs;
      [
        #rocm-opencl-icd
        #rocm-opencl-runtime
        amdvlk
      ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
}
