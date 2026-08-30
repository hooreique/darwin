{
  description = "nix-darwin system configuration of hoomac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nix-darwin, ... }:
    let
      hostname = "hoomac";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        modules = [
          {
            nixpkgs.hostPlatform = "aarch64-darwin";
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
          ./darwin-configuration.nix
        ];
      };
    };
}
