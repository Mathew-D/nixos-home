
{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "lenovo-intel-ish-firmware";
  version = "5.8.36.0";

  src = pkgs.fetchurl {
    url = "https://download.lenovo.com/consumer/mobiles/zzyo037fue80ujh0.exe";
    hash = "sha256-cb3DPBwcfuA7n7vG0jRb1cLKXWAcacgWLU8bYnHBxJ4=";
  };

  nativeBuildInputs = [
    pkgs.innoextract
  ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p extracted

    innoextract --extract --output-dir extracted "$src"

    install -Dm644 \
      "extracted/code\$GetExtractPath\$/Source/IshHeciExtensionTemplate/x64/FWImage/0003/ishS_MEU_aligned.bin" \
      "$out/lib/firmware/intel/ish/ish_lnlm.bin"

    runHook postInstall
  '';
}
