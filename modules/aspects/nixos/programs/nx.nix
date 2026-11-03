{
  flake.aspects.nx.nixos =
    { pkgs, user, ... }:
    let
      flakeDir = "/home/${user.name}/.config/nixos";
    in
    {
      programs.nh = {
        enable = true;
        flake = flakeDir;
      };

      environment.systemPackages = [
        pkgs.just

        (pkgs.writeShellScriptBin "nx" ''
          #!/usr/bin/env bash
          set -euo pipefail

          if [[ -f "${flakeDir}/justfile" ]]; then
            exec just -f "${flakeDir}/justfile" "$@"
          fi

          printf 'Error: no justfile found in: "${flakeDir}"' >&2
          exit 1
        '')
      ];
    };
}
