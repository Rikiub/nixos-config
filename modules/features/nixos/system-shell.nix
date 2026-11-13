{
  flake.aspects.system-shell.nixos = { pkgs, ... }: {
    environment = {
      # Add ~/.local/bin to PATH.
      localBinInPath = true;

      # Required for pkexec
      shells = [ pkgs.nushell ];
    };

    # Set Nushell as default from Bash
    programs.nushell.enable = true;
    programs.bash = {
      enable = true;
      interactiveShellInit = ''
        if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
          exec nu
        fi
      '';
    };
  };
}
