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

  ts3-noweb.url = "github:Jokler/ts3client-noweb-nix";
  
  devin = {
    url = "github:Mathew-D/rift-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  noctalia = {
    url = "github:noctalia-dev/noctalia/cachix";
  };
  };

outputs = { self, nixpkgs, chaotic, ... }@inputs:
  let
    system = "x86_64-linux";
    
    mkHost = name: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${name}.nix
         chaotic.nixosModules.nyx-cache
          chaotic.nixosModules.nyx-overlay
          chaotic.nixosModules.nyx-registry
      ];
    };

    hosts = [ "main" "forest" "laptop" ];
  in {
    nixosConfigurations = builtins.listToAttrs (
      map (name: {
        name = name;
        value = mkHost name;
      }) hosts
    );
  };
}
