{
  flake.aspects.default-shell.nixos = { pkgs, ... }: {
    # Required for pkexec
    environment.shells = [ pkgs.nushell ];

    # Set nushell as default
    programs.nushell.enable = true;
    users.defaultUserShell = pkgs.nushell;
  };
}
