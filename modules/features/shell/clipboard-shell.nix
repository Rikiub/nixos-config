{
  flake.aspects.clipboard-shell.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      clipboard-jh # Cross-platform command
      wl-clipboard # Wayland Support
    ];
  };
}
