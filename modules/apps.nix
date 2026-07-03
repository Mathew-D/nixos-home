{ pkgs, inputs, ... }:

{
 nixpkgs.overlays = [ inputs.ts3-noweb.overlays.default ];

 environment.systemPackages = [
  pkgs.pcloud
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
  pkgs.veracrypt
  pkgs.vesktop
  pkgs.thunderbird
  pkgs.libreoffice-fresh
  pkgs.masterpdfeditor4
  pkgs.scenebuilder
  pkgs.lutris

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
  inputs.devin.packages.x86_64-linux.default
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
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

}
