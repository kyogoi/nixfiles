{ config, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "America/New_York";
  services.xserver.xkb.layout = "us";

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  # virtualisation.docker.enable = true;
}
