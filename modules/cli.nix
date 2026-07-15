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
    procps
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
    wireguard-tools
    pciutils
    
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

    (writeShellApplication {
      name = "game-performance";
      runtimeInputs = [
        power-profiles-daemon
        systemd
        gnugrep
      libnotify
      ];
      text = ''
        # Helper script to enable the performance profile with Proton or others.
      notify() {
        if command -v notify-send >/dev/null 2>&1; then
          notify-send -a "game-performance" "$1" "$2"
        fi
      }

        if ! command -v powerprofilesctl >/dev/null 2>&1; then
            echo "Error: powerprofilesctl not found" >&2
            exit 1
        fi

        # Don't fail if the CPU driver doesn't support performance profile.
        if ! powerprofilesctl list | grep -q 'performance:'; then
        notify "Game Performance" "Performance profile not supported; launching normally."
            exec "$@"
        fi

        # Set performance profile while the game is running.
      notify "Game Performance" "Performance mode enabled."

        if [ -n "$GAME_PERFORMANCE_SCREENSAVER_ON" ]; then
        powerprofilesctl launch -p performance \
                -r "Launched with CachyOS game-performance utility" -- "$@"
        else
        systemd-inhibit --why "CachyOS game-performance is running" \
                powerprofilesctl launch -p performance \
                -r "Launched with CachyOS game-performance utility" -- "$@"
        fi

      status=$?
      notify "Game Performance" "Performance mode disabled."
      exit "$status"
      '';
    })

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
    rustup
  ];

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };


  
}
