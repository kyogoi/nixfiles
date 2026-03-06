{
  pkgs,
  inputs,
  ...
}:
{
  programs.zsh.enable = true;

  users.users = {
    alice = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
      ];
    };
  };

  # TODO: is this where I want to do HomeManager? Fuck it
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "alice" = import ../../../home/users/alice.nix;
    };
  };
}
