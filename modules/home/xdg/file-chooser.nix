{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

    config = {
      # Applies to all desktops
      common."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];

      # Specific desktop environment
      # niri."org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
}
