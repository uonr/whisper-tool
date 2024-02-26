{
  description = "Whisper Tool";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            openai-whisper-cpp
            python310
            ffmpeg
            yt-dlp
          ];
          shellHook = ''
            source ./venv/bin/activate
          '';
        };
      });
}
