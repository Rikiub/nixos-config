{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };

  # cd shortcuts
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  # Completions
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  # Prompt
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
}
