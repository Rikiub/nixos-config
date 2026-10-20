{
  flake.aspects.shell.homeManager = { ... }: {
    home.sessionVariables = {
      EDITOR = "fresh";
      PAGER = "bat --paging=always";
      MANPAGER = "bat -l man -p";
    };
  };
}
