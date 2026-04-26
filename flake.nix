{
  description = "nix-darwin system configuration of hoomac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: let
    hostname = "hoomac";
  in {
    darwinConfigurations.${hostname} = inputs.nix-darwin.lib.darwinSystem {
      modules = [
        {
          nixpkgs.hostPlatform = "aarch64-darwin";
        }
        ./darwin-configuration.nix
      ];
      specialArgs = {
        inherit inputs;
        main-username = "song";
      };
    };
  };
}
