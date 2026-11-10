{
  flake.aspects.default-shell.nixos = { pkgs, ... }: {
    # Add ~/.local/bin to PATH.
    environment.localBinInPath = true;

    # Required for pkexec
    environment.shells = [ pkgs.nushell ];

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
