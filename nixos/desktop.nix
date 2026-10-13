{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  # Autologin
  services.displayManager.autoLogin = {
    enable = true;
    user = "rikiub";
  };

  # Display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Desktop sessions
  programs.niri.enable = true;

  # Set default session
  services.displayManager.defaultSession = lib.mkForce "niri";
}
