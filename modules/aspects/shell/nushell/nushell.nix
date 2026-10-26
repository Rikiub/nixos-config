{
  flake.aspects.nushell = {
    nixos = { pkgs, ... }: {
      # Required for pkexec
      environment.shells = [ pkgs.nushell ];

      # Set nushell as default
      programs.nushell.enable = true;
      users.defaultUserShell = pkgs.nushell;
    };

    homeManager = { ... }: {
      programs = {
        nushell = {
          enable = true;
          configFile.source = ./config.nu;
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
  };
}
