{ lib, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoLogin = {
      enable = true;
      user = "rikiub";
    };
  };

  # Add niri session
  programs.niri.enable = true;

  # Set default session
  services.displayManager.defaultSession = lib.mkForce "niri";
}
