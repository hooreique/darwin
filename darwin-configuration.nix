{
  system.stateVersion = 7;
  system.startup.chime = false;
  security.pam.services.sudo_local.touchIdAuth = true;

  system.activationScripts.batteryPowerMode.text = ''
    # -b: battery only
    # 0 = automatic (default), 1 = low power mode
    /usr/bin/pmset -b powermode 1
  '';
}
