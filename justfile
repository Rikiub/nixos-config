default:
    @just --list

# Rebuild to default host
rebuild:
    @git add .
    sudo nixos-rebuild switch --flake .#nixos

update-flake:
    nix flake update

update: update-flake rebuild
