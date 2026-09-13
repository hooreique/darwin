{
  determinateNix = {
    enable = true;
    customSettings = {
      trusted-users = [ "root" ];
      extra-substituters = [
        "https://hooreique.cachix.org"
        "https://cache.numtide.com"
      ];
      extra-trusted-substituters = [
        "https://hooreique.cachix.org"
        "https://cache.numtide.com"
      ];
      extra-trusted-public-keys = [
        "hooreique.cachix.org-1:xuPFUhHZkm48tim3zma5/v67Fag5vn8XLBXLiYYeXOE="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
    };
  };
}
