default:
    @just --list

# interactive

[doc("Open /etc/nixos with EDITOR or other")]
[group("interactive")]
edit editor=env("EDITOR", ""):
    @{{ editor }} .

# maintenance

[doc("Aggressive GC + optimise store")]
[group("maintenance")]
clean:
    sudo nix-collect-garbage -d
    nix-store --optimise

[doc("List system generations")]
[group("maintenance")]
gens:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

[doc("Delete generations older than N days")]
[group("maintenance")]
gc days="14":
    sudo nix-collect-garbage --delete-older-than {{ days }}d

# git

[doc("Commit current changes")]
[group("git")]
commit message:
    @git add .
    git commit -m "{{ message }}"

[doc("Push commits to respository")]
[group("git")]
push:
    git push

[doc("Commit + push in one go")]
[group("git")]
save message:
    @just commit "{{ message }}"
    @just push

[doc("Show status")]
[group("git")]
status:
    @git add .
    @git status --short

# nix

[doc("Rebuild to default host")]
[group("nix")]
rebuild host=env("HOSTNAME", ""):
    @git add .
    sudo nixos-rebuild switch --flake .#{{ host }}

[doc("Roll back to previous generation")]
[group("nix")]
rollback:
    sudo nixos-rebuild switch --rollback

[doc("Update flake.lock and rebuild system")]
[group("nix")]
update:
    nix flake update --commit-lock-file
    @just rebuild
