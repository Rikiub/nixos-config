{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.just

    # Run just in /etc/nixos from anywhere
    (pkgs.writeShellScriptBin "jn" ''
      just -f "/etc/nixos/justfile" "$@"
    '')
  ];
}
