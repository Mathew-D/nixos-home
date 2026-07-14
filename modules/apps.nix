{ pkgs, inputs, ... }:

{
 nixpkgs.overlays = [ inputs.ts3-noweb.overlays.default ];

 environment.systemPackages = [
  pkgs._1password-gui
  pkgs.corectrl
  pkgs.cryptomator
  pkgs.chromium
  pkgs.celluloid
  pkgs.eog
  pkgs.nautilus
  pkgs.nwg-look
  pkgs.foot
  pkgs.mpv
  pkgs.mumble
  pkgs.networkmanagerapplet
  pkgs.qbittorrent
  pkgs.pywalfox-native
  pkgs.vesktop
  pkgs.thunderbird
  pkgs.libreoffice-fresh
  pkgs.scenebuilder
  pkgs.lutris
  #pkgs.pcloud
  pkgs.gedit
  pkgs.gnome-disk-utility
  
  (pkgs.veracrypt.overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      # Install a PNG icon so launchers can use theme lookup instead of VeraCrypt's XPM.
      install -d "$out/share/icons/hicolor/256x256/apps"
      ${pkgs.imagemagick}/bin/convert \
        "$out/share/pixmaps/veracrypt.xpm" \
        "$out/share/icons/hicolor/256x256/apps/veracrypt.png"

      substituteInPlace "$out/share/applications/veracrypt.desktop" \
        --replace-fail "Icon=veracrypt.xpm" "Icon=veracrypt"
    '';
  }))
 
    (pkgs.masterpdfeditor4.overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      substituteInPlace "$out/share/applications/masterpdfeditor4.desktop" \
        --replace-fail "Icon=masterpdfeditor4/masterpdfeditor4.png" "Icon=masterpdfeditor4"
    '';
  }))


 (pkgs.vscode.fhsWithPackages (ps: with ps; [
     #Rust 
    libX11
    libXi
    libxkbcommon
    libGL

    #Java
    libXxf86vm
    glib
    libXtst
    ]))

  inputs.noctalia.packages.${pkgs.system}.default
  inputs.rift.packages.x86_64-linux.default
  inputs.pcloud.packages.x86_64-linux.default
  inputs.devin.packages.x86_64-linux.default
  inputs.bambustudio.packages.x86_64-linux.default
  pkgs.teamspeak3

  (pkgs.writeShellScriptBin "processing" ''
    export _JAVA_OPTIONS="--add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED --add-opens=java.desktop/java.awt=ALL-UNNAMED"
    exec ${pkgs.processing}/bin/processing "$@"
  '')
];
#programs.noctalia.enable = true;
  programs.firefox.enable = true;

  #Gaming
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

}
