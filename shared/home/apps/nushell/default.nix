{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };
  xdg.configFile."nushell/autoload".source = ./autoload;

  # cd shortcuts
  programs.zoxide.enable = true;

  # Set a nice prompt
  programs.starship.enable = true;

  # Install fish only for autocompletions
  programs.fish.enable = true;
}
