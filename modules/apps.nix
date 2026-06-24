{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    _1password-gui
    corectrl
    cryptomator
    chromium
    bambu-studio
    celluloid
    eog
    nautilus
    nwg-look
    foot
    vscode
    mpv
    mumble
    networkmanagerapplet
    qbittorrent
    pywalfox-native
     veracrypt
    vesktop
    thunderbird
    
    libreoffice-fresh
    masterpdfeditor4
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    scenebuilder
   (writeShellScriptBin "processing" ''
    export _JAVA_OPTIONS="--add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED --add-opens=java.desktop/java.awt=ALL-UNNAMED"
    exec ${pkgs.processing}/bin/processing "$@"
  '')

  ];
  programs.firefox.enable = true;


}
