{
  description = "rtft's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    # bling = { url = "github:BlingCorp/bling"; flake = false; };
    # rubato = { url = "github:andOrlando/rubato"; flake = false; };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    #TODO: Change system later to be more dynamic
    pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # VM 
      sequoia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs pkgs-unstable;};
        modules = [
        ./hosts/sequoia
	      # {nixpkgs.overlays = [ nixpkgs-f2k.overlays.window-managers ];}
	      ];
      };
      # Thinkpad X1 yoga
      redwood = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs pkgs-unstable;};
        modules = [./hosts/redwood];
      };
      # GPD Win Mini
      cottonwood = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs pkgs-unstable;};
        modules = [
        ./hosts/cottonwood 
        ./modules/core
        ./modules/applications
        ./modules/desktop/hyprland
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "rain@sequoia" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/home.nix
        ];
      };
      "rain@redwood" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [./home/home.nix];
      };
      "rain@cottonwood" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        modules = [./home/home.nix];
      };
    };
  };
}
