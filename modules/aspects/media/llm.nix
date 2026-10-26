{
  flake.aspects.llm = {
    nixos = { pkgs, ... }: {
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = [ "ministral-3:8b" ];
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [ opencode ];
    };
  };
}
