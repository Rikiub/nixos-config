{
  flake.aspects.llm = {
    nixos = { pkgs, ... }: {
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [ opencode ];
    };
  };
}
