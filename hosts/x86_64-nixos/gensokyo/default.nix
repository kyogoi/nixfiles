{ ... }:
{
  imports = [
    ./system.nix
    ./users.nix
    ./nvidia.nix
    ./amdcpu.nix
    #./fonts.nix
    ./hardware-configuration.nix
  ];
}
