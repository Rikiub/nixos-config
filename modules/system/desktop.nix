{
  pkgs,
  config,
  lib,
  ...
}:

{
  # Essensials
  environment.systemPackages = with pkgs; [
    wl-clipboard
    xwayland-satellite # x11 support on wayland
  ];

  services = {
    udisks2.enable = true; # File managers support

    displayManager = {
      # Autologin on unlock
      autoLogin = {
        enable = true;
        user = config.user.name;
      };

      # Display Manager
      noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ config.user.name ];
      };

      # Set default session
      defaultSession = lib.mkForce "niri";
    };
  };

  # Desktop sessions
  programs.niri = {
    enable = true;
    useNautilus = false;
  };
}
