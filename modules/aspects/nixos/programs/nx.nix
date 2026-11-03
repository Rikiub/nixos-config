{
  flake.aspects.nx.nixos =
    { pkgs, ... }:
    let
      relFlakeDir = ".config/nixos";
    in
    {
      programs.nh = {
        enable = true;
        flake = "$HOME/${relFlakeDir}";
      };

      environment.systemPackages = [
        pkgs.just

        (pkgs.writeShellScriptBin "nx" ''
          #!/usr/bin/env bash
          set -euo pipefail

          if [[ -f "${relFlakeDir}/justfile" ]]; then
            exec just -f "${relFlakeDir}/justfile" "$@"
          fi

          printf 'Error: no justfile found in: "${relFlakeDir}"' >&2
          exit 1
        '')
      ];
    };
}
