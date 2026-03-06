{ config, lib, pkgs, ... }:
##################################################################
#
# gensokyo - NixOS, AMD Ryzen 9850x3D, RTX 5070ti GPU
#
##################################################################
let
  hostName = "gensokyo";
in
{
  ## Boot, systemd
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Boot, secure boot
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
 
  # I do not remember why I want to be on latest kernel but I do
  boot.kernelPackages = pkgs.linuxPackages_latest;

  ## Networking
  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  ## State version
  # Probably never, ever touch this
  system.stateVersion = "25.11";
}
