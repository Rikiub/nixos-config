{
  flake.aspects.acer-laptop.homeManager = { ... }: {
    programs.obsidian.vaults = {
      "Obsidian".target = "Documentos/Obsidian";
    };
  };
}
