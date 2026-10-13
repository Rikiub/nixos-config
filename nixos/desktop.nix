{ lib, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Add niri session
  programs.niri.enable = true;

  # Set default session
  services.displayManager.defaultSession = lib.mkForce "niri";
}
