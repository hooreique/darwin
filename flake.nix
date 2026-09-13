{
  description = "nix-darwin system configuration of hoomac";

  inputs.nix-darwin.url = "https://flakehub.com/f/nix-darwin/nix-darwin/0";
  inputs.determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

  outputs =
    { nix-darwin, determinate, ... }:
    let
      system = "aarch64-darwin";
      hostname = "hoomac";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          determinate.darwinModules.default
          ./determinate.nix
          ./darwin-configuration.nix
        ];
      };
    };
}
