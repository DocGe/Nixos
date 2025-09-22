{ pkgs ? import <nixpkgs> {}
}: pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    cmake
    pkg-config
    gcc_multi


];
}
