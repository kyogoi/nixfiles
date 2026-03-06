{ config, lib, pkgs, ... }:
{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.exportConfiguration = true;

  # TODO: Don't think I want to do this here
  environment.pathsToLink = 
  [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    # TODO: Despite being on latest kernel, neither beta nor latest Nvidia drivers compile
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
