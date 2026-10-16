{ pkgs, ... }:

{
  environment.systemPackages = [
    # Just inside config from anywhere
    (pkgs.writeShellScriptBin "njust" ''
      just -f "/etc/nixos/justfile" "$@"
    '')
  ];
}
