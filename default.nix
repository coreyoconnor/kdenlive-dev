let
  pkgs-next = import ./nixpkgs/pkgs/top-level {
    overlays = [
      (import ./kdenlive-next.nix)
    ];
    localSystem = { system = builtins.currentSystem; };
    crossSystem = null;
  };
  pkgs-dev = import ./nixpkgs/pkgs/top-level {
    overlays = [
      (import ./kdenlive-next.nix)
      (import ./use-local-src.nix)
    ];
    localSystem = { system = builtins.currentSystem; };
    crossSystem = null;
  };
in {
  inherit pkgs-next pkgs-dev;
  env = pkgs-dev.stdenv.mkDerivation rec {
    pname = "env";
    version = "0.1";
    shellHook = ''
      alias cls=clear
      if [ ! -d build ] ; then
        mkdir -p build
        (
          cd build
          cmake ../kdenlive -DCMAKE_BUILD_TYPE=Debug # -DOpenGL_GL_PREFERENCE=GLVND
        )
      fi
    '';
    nativeBuildInputs = with pkgs-dev; [ cmake pkgconfig extra-cmake-modules ];
    buildInputs = with pkgs-dev; kdenlive.buildInputs ++ mlt.buildInputs ++ movit.buildInputs ++ [
    ];
  };
}
