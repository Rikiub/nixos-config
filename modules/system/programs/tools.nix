{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.just

    # Just inside config from anywhere
    (pkgs.writeShellScriptBin "jn" ''
      just -f "/etc/nixos/justfile" "$@"
    '')
  ];
}
