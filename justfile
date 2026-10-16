default:
    @just --list --unsorted

# nix

[doc("Rebuild to default host")]
[group("nix")]
rebuild host="":
    @git add .
    sudo nixos-rebuild switch --flake .#{{ host }}

[doc("Roll back to previous generation")]
[group("nix")]
rollback:
    sudo nixos-rebuild switch --rollback

[doc("Update flake.lock and rebuild system")]
[group("nix")]
update:
    nix flake update
    @just rebuild
    @just save "flake.lock updated"

# git

[doc("Show status")]
[group("git")]
status:
    @git status --short

[doc("Show commit graph")]
[group("git")]
log max="20":
    @git log --graph --decorate --oneline -n {{ max }} --all

[doc("Commit + push in one go")]
[group("git")]
save message="auto-commit":
    @just rebuild
    @git add .
    -git commit -m "{{ message }}"
    -git push

# interactive

[doc("Open /etc/nixos with EDITOR or other")]
[group("interactive")]
edit editor=env("EDITOR", ""):
    @{{ editor }} .

# maintenance

[doc("List system generations")]
[group("maintenance")]
gens:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

[doc("Aggressive GC + optimise store")]
[group("maintenance")]
clean:
    sudo nix-collect-garbage -d
    nix-store --optimise

[doc("Delete generations older than N days")]
[group("maintenance")]
gc days="14":
    sudo nix-collect-garbage --delete-older-than {{ days }}d
