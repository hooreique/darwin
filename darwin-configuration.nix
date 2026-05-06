{ inputs, main-username, ... }:
{
  environment.systemPackages = [ ];
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 6;

  environment.etc."nix/nix.custom.conf".text = ''
    trusted-users = ${main-username}

    extra-substituters = https://hooreique.cachix.org
    extra-trusted-substituters = https://hooreique.cachix.org
    extra-trusted-public-keys = hooreique.cachix.org-1:xuPFUhHZkm48tim3zma5/v67Fag5vn8XLBXLiYYeXOE=

    extra-substituters = https://cache.numtide.com
    extra-trusted-substituters = https://cache.numtide.com
    extra-trusted-public-keys = niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=
  '';
  security.pam.services.sudo_local.touchIdAuth = true;
}
