{
  description = "template-python-utility - Template for Python CLI utilities";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (system: pkgs: rec {
        default = template-python-utility;
        template-python-utility = pkgs.stdenvNoCC.mkDerivation {
          pname = "template-python-utility";
          version = "1.0.0";
          src = ./.;

          nativeBuildInputs = [ pkgs.makeWrapper ];

          installPhase = ''
            mkdir -p $out/bin $out/share/zsh/site-functions
            install -D -m 0755 bin/template-python-utility $out/bin/template-python-utility
            wrapProgram $out/bin/template-python-utility \
              --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.python3 ]}
            if [ -d completion ]; then
              cp -r completion/* $out/share/zsh/site-functions/ 2>/dev/null || true
            fi
          '';

          meta = {
            description = "Template Python command-line utility";
            mainProgram = "template-python-utility";
            platforms = pkgs.lib.platforms.unix;
          };
        };
      });

      apps = forAllSystems (system: pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/template-python-utility";
        };
      });
    };
}
