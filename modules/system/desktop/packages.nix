{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  services.udisks2.enable = true; # File managers support
}
