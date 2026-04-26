{ inputs, ... }:
{
  environment.systemPackages = [ ];
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;

  security.pam.services.sudo_local.touchIdAuth = true;
}
