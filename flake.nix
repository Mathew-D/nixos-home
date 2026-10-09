{
  description = "NixOS system";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  noctalia-greeter = {
    url = "github:noctalia-dev/noctalia-greeter";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  rift = {
    url = "github:Mathew-D/rift-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  bambustudio = {
    url = "git+https://github.com/Mathew-D/bambustudio-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  
  pcloud = {
    url = "github:Mathew-D/pcloud-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  umbriel = {
    url = "git+https://github.com/noctalia-dev/umbriel";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  xdg-desktop-portal-umbriel = {
    url = "github:noctalia-dev/xdg-desktop-portal-umbriel";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  ts3-noweb.url = "github:Jokler/ts3client-noweb-nix";
  
  devin = {
     url = "github:Mathew-D/devin-desktop-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  noctalia = {
    url = "github:noctalia-dev/noctalia/cachix";
  };
  };

outputs = { self, nixpkgs, chaotic, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    runtimeLibs = with pkgs; [
      libX11
      libXi
      libxkbcommon
      libGL
      wayland
      vulkan-loader
      libXxf86vm
      glib
      libXtst
      dbus
    ];

    mkHost = name: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${name}/default.nix
        chaotic.nixosModules.default
      ];
    };

    hosts = [ "main" "forest" "laptop" ];
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "coding-env";

      packages = with pkgs; [
        git
        gcc
        gnumake
        cmake
        pkg-config
        python3
        python3Packages.pip
        nodejs
        nil
        nixd
        alejandra
        fd
        ripgrep
        jq
        tree
        unzip
        curl
        wget
 
      ] ++ runtimeLibs;

      shellHook = ''
        export EDITOR="nano"
        export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath runtimeLibs}:$LD_LIBRARY_PATH"
        echo "Coding environment ready."
      '';
    };

    nixosConfigurations = builtins.listToAttrs (
      map (name: {
        name = name;
        value = mkHost name;
      }) hosts
    );
  };
}
