{
  flake.aspects.anv16.homeManager = { ... }: {
    programs.obsidian.vaults = {
      "Obsidian".target = "Documentos/Obsidian";
    };
  };
}
