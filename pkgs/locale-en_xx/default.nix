{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "locale-en_xx";
  version = "2017";

  src = ./locale-en_xx-2017.tar.xz;

  patches = [
    ./force-24h.patch
  ];

  installPhase = ''
    runHook preInstall
    install -Dm644 "en_XX@POSIX" "$out/share/i18n/locales/en_XX@POSIX"
    runHook postInstall
  '';

  meta = {
    description = "A mixed international English locale with ISO and POSIX formats for cosmopolitan coders.";
    homepage = "https://xyne.dev/projects/locale-en_xx";
    license = lib.licenses.gpl2;
  };
}
