default:
    @just --list

# nix

[doc("Rebuild to default host")]
[group("nix")]
rebuild:
    @git add .
    sudo nixos-rebuild switch --flake .#nixos

[doc("Update flake.lock")]
[group("nix")]
update-flake:
    nix flake update --commit-lock-file

[doc("Update flake and rebuild system")]
[group("nix")]
update: update-flake rebuild

# git

[doc("Commit current changes")]
[group("git")]
commit message:
    @git add .
    git commit -m "{{ message }}"

[doc("Push changes to respository")]
[group("git")]
push:
    git push
