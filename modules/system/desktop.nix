{ pkgs, lib, ... }:

let
  username = "rikiub";
in
{
  # Essensials
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
  services.udisks2.enable = true; # File managers support

  # Autologin
  services.displayManager.autoLogin = {
    enable = true;
    user = username;
  };

  # Display manager
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = [ username ];
  };

  # Desktop sessions
  programs.niri.enable = true;

  # Set default session
  services.displayManager.defaultSession = lib.mkForce "niri";
}
