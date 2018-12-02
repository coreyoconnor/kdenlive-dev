let
  nixpkgs-config = {
  };
  pkgs-next = import ./nixpkgs/pkgs/top-level {
    config = nixpkgs-config;
    overlays = [
      (import ./kdenlive-next.nix)
    ];
    localSystem = { system = builtins.currentSystem; };
  };
  pkgs-dev = import ./nixpkgs/pkgs/top-level {
    config = nixpkgs-config;
    overlays = [
      (import ./kdenlive-next.nix)
      (import ./use-local-src.nix)
    ];
    localSystem = { system = builtins.currentSystem; };
  };
in {
  inherit pkgs-next pkgs-dev;
  env = pkgs-dev.stdenv.mkDerivation rec {
    name = "env";
    shellHook = ''
      alias cls=clear
    '';
    nativeBuildInputs = with pkgs-dev; [ cmake pkgconfig extra-cmake-modules ];
    buildInputs = with pkgs-dev; kdenlive.buildInputs ++ mlt.buildInputs ++ movit.buildInputs ++ [
    ];
  };
}
