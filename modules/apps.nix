{ config, lib, pkgs, inputs, ... }:

let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in

{
  imports = [ inputs.artcraft.nixosModules.default ];

  nixpkgs.overlays = [ inputs.ts3-noweb.overlays.default ];
  fonts.fontDir.enable = true;
  #systemd.tmpfiles.rules = [
  #  "d /usr/share 0755 root root -"
  #  "L+ /usr/share/fonts - - - - /run/current-system/sw/share/X11/fonts"
  #];

 environment.systemPackages = [
  pkgs._1password-gui
  pkgs.corectrl
  pkgs.cryptomator
  pkgs.chromium
  pkgs.celluloid
  pkgs.loupe
  #pkgs.eog #replaced with loupe
  pkgs.nemo-with-extensions
  pkgs.nwg-look
  pkgs.foot
  pkgs.mpv
  pkgs.mumble
  (pkgs.networkmanagerapplet.overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      rm -f "$out/etc/xdg/autostart/nm-applet.desktop"
    '';
  }))
  pkgs.qbittorrent
  pkgs.pywalfox-native
  pkgs.vesktop
  pkgs.wdisplays
  pkgs.thunderbird
  pkgs.libreoffice-fresh
  pkgs.scenebuilder
  pkgs.lutris
  #pkgs.pcloud
  pkgs.gedit
  pkgs.gnome-disk-utility
  pkgs.librewolf
  
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
    wayland
    #Java
    libXxf86vm
    glib
    libXtst
    gtk3
    ffmpeg_6
    maven
    ]))

  inputs.rift.packages.x86_64-linux.default
  inputs.pcloud.packages.x86_64-linux.default
  inputs.devin.packages.x86_64-linux.default
  inputs.bambustudio.packages.x86_64-linux.default
  inputs.euro-office.packages.${pkgs.stdenv.hostPlatform.system}.default
  pkgs.teamspeak3



  (pkgs.writeShellScriptBin "processing" ''
    export _JAVA_OPTIONS="--add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED --add-opens=java.desktop/java.awt=ALL-UNNAMED"
    exec ${pkgs.processing}/bin/processing "$@"
  '')
];
#programs.noctalia.enable = true;

  #Gaming
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      # gamescopeSession.enable = true;
    };
  };

}
