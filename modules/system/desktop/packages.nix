{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard # Required for tools (Like GitHub CLI)
    xdg-user-dirs-gtk
  ];

  programs.partition-manager.enable = true; # KDE Partition Manager
  services.udisks2.enable = true; # File managers support
}
