{
  flake.aspects.bat.homeManager = { ... }: {
    # Enable bat
    programs.bat.enable = true;

    # Apply in other places
    home.sessionVariables = {
      PAGER = "bat --paging=always";
      MANPAGER = "bat -l man -p";
    };
  };
}
