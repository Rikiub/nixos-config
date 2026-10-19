{
  flake.modules.homeManager.shell = { ... }: {
    home.sessionVariables = {
      EDITOR = "fresh";
      PAGER = "bat --paging=always";
      MANPAGER = "bat -l man -p";
    };
  };
}
