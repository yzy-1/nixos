{ lib, stdenv, fetchurl, pkgs }:

let
  src = ./src;
  rename-script = src + "/fontname.py";
  chws-tool = pkgs.callPackage ../chws-tool { };
  fonttools-opentype-feature-freezer = pkgs.callPackage ../fonttools-opentype-feature-freezer { };
in
stdenv.mkDerivation rec {
  pname = "redfish-sans";
  version = "1.000";

  nativeBuildInputs = with pkgs; [
    unzip
    chws-tool
    fonttools-opentype-feature-freezer
    python3Packages.fonttools
  ];

  inherit src;

  patchPhase = ''
    ln -s ${pkgs.sarasa-gothic}/share/fonts/truetype/*.ttc .
    ln -s ${rename-script} .
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 build/*.ttf -t $out/share/fonts/truetype/
    runHook postInstall
  '';
}
