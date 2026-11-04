{
  flake.aspects.llm = {
    nixos =
      {
        pkgs,
        config,
        ...
      }:
      let
        nvidiaEnabled = builtins.elem "nvidia" config.services.xserver.videoDrivers;
        package = if nvidiaEnabled then pkgs.ollama-cuda else pkgs.ollama;
      in
      {
        services.ollama = {
          enable = true;
          inherit package;
          # loadModels = [ "ministral-3:8b" ];

          environmentVariables = {
            OLLAMA_CONTEXT_LENGTH = "16384"; # 16K

            # Required for KV cache
            OLLAMA_FLASH_ATTENTION = "1";

            # Quantize the KV cache to fit longer context in VRAM
            OLLAMA_KV_CACHE_TYPE = "q4_0";

            # Keep the model loaded longer for quicker agent responses
            OLLAMA_KEEP_ALIVE = "10m";
          };
        };
      };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [ opencode ];
    };
  };
}
