{
  inputs = {
    # NixOS unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    # Uncomment for Japanese font repository
    # nixos-fonts.url = "github:Takamatsu-Naoki/nixos-fonts";
    # Secure Boot
    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = 
  {
    self,
    nixpkgs,
    home-manager,
    lanzaboote,
    ...
  }@inputs:
  {
    nixosConfigurations = {
      gensokyo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          
          { nixpkgs.config.allowUnfree = true; }
          inputs.lanzaboote.nixosModules.lanzaboote
          # TODO: I don't think this is where I want to handle this but I don't know where I do yet
          
          ./modules/profiles/base.nix
          ./hosts/x86_64-nixos/gensokyo
        ];
      };
    };
  };
}
