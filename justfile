default:
    @just --list --unsorted

# nix

[doc("Build and switch to a specified NixOS flake configuration")]
[group("nix")]
switch host="":
    @just sync
    nh os switch --quiet .#{{ host }}

[doc("Build and activate a specified NixOS flake configuration specialisation")]
[group("nix")]
test host="":
    @just sync
    nh os test --quiet .#{{ host }}

[doc("Rollback to previous generation")]
[group("nix")]
rollback:
    nh os rollback .

[doc("Update all the flake inputs and rebuild system")]
[group("nix")]
update:
    @just sync
    nh os switch --quiet --update .

[doc("Sync flake inputs")]
[group("nix")]
sync:
    @git add .
    nix run .#write-flake

[doc("List available generations from profile path")]
[group("nix")]
info:
    nh os info

[doc("Aggressive GC + optimise store")]
[group("nix")]
clean:
    nh clean all --optimise

# interactive

[doc("Search for a package in Nixpkgs")]
[group("interactive")]
search *args:
    nh search {{ args }}

[doc("Load system in a repl")]
[group("interactive")]
repl:
    nh os repl .

[doc("Open configuration directory on application")]
[group("interactive")]
open app=env("EDITOR", ""):
    @{{ app }} .

[doc("Build and run NixOS VM image of current host")]
[group("interactive")]
vm:
    mkdir -p tmp/
    cd tmp/ && nh os build-vm --run

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
    @git add .
    -git commit -m "{{ message }}"
    -git push
