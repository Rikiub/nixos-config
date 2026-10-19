{
  flake.modules.homeManager.shell = { lib, config, ... }: {
    programs = {
      nushell = {
        enable = true;
        configFile.source = ./config.nu;
        environmentVariables = lib.mkMerge [
          config.home.sessionVariables
        ];
      };

      # cd shortcuts
      zoxide = {
        enable = true;
        enableNushellIntegration = true;
      };

      # Completions
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };

      # Prompt
      starship = {
        enable = true;
        enableNushellIntegration = true;
        presets = [ "pure-preset" ];
      };
    };
  };
}
