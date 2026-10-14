{
  imports = [
    ./default-apps.nix
    ./user-dirs.nix
  ];

  home.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };

  xdg = {
    enable = true;
    autostart.enable = true;
  };
}
