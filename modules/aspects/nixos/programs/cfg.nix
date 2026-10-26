{
  flake.aspects.cfg.nixos = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.just

      (pkgs.writeShellScriptBin "cfg" ''
        #!/usr/bin/env bash
        set -euo pipefail

        flakeDirs=(
          "$HOME/.nixos"
          "$HOME/.config/nixos"
          "/etc/nixos"
        )

        for dir in "''${flakeDirs[@]}"; do
          if [[ -f "$dir/justfile" ]]; then
            exec just -f "$dir/justfile" "$@"
          fi
        done

        printf 'Error: no justfile found in any of: %s\n' "''${flakeDirs[*]}" >&2
        exit 1
      '')
    ];
  };
}
