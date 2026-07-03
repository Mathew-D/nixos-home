{ config, pkgs, inputs, ... }:

{
  imports = [
    ./display/greetd.nix
    ./desktop/niri.nix
   # ./desktop/plasma.nix
    ./users
    ./modules/cli.nix
    ./modules/apps.nix
    ./modules/shell.nix
    ./modules/env.nix
  # ./modules/skel.nix
    ./modules/theme.nix
    inputs.home-manager.nixosModules.home-manager
  ];

# Turn flakes on
 nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #Networking
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  services.gvfs = {
  enable = true;
  package = pkgs.gnome.gvfs;
};

  services.gnome.gnome-keyring.enable = true; 
  #security.polkit.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

   
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Fonts
fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  nerd-fonts.roboto-mono
];  
  # Optional but recommended for better app compatibility
  fonts.fontconfig.enable = true;

  # Clean up old generations
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  #Hardware
hardware.graphics = {
  enable = true;
  enable32Bit = true;

  extraPackages = with pkgs; [
    mesa
    libglvnd
  ];

  extraPackages32 = with pkgs.pkgsi686Linux; [
    mesa
    libglvnd
  ];
};
#  hardware.graphics.enable = true;
#  hardware.graphics.enable32Bit = true; 

  # Printing
  services.printing.enable = true;

  # Use Flatpak for large third-party desktop apps.
  services.flatpak.enable = true;

  # Audio (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
programs.fuse.userAllowOther = true;
  programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";

  # Home Manager configuration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mdusome = {
      imports = [ ./home/mdusome.nix ];
    };
  };
}

