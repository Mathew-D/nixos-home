{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core
    curl
    wget
    git
    file
    unzip
    zip
    killall
    btrfs-progs

    # Modern CLI tools
    fd
    ripgrep
    bat
    eza
    fzf

    # Utilities
    ps_mem
    tree
    btop
    wl-clipboard
    wayland-utils
    brightnessctl
    xwayland-satellite # xwayland support
    gpu-screen-recorder
    playerctl
    
    #Dev Tools
    jdk25
    openjfx
    libXtst
    glib
    gtk3

    #Graphics
    mesa
    libglvnd
    vulkan-loader
    vulkan-tools
    mesa-demos

    #Proton
    umu-launcher
    protonup-rs

    (python314.withPackages (ps: with ps; [
      pyside6
    ]))

    qt6Packages.qttools
    #qt6.qttools
    #qt6.base
    
    libX11
    libXcursor
    libXi
    libXrandr
    libXinerama
    libxkbcommon
    libXxf86vm
    gcc
    rustc
    cargo
    rustup
  ];


  
}
