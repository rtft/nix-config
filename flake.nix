{
  description = "rtft's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #   url = "github:hyprwm/Hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    

    # TODO: Add any other flake you might need

    # nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    # bling = { url = "github:BlingCorp/bling"; flake = false; };
    # rubato = { url = "github:andOrlando/rubato"; flake = false; };
  };

  outputs = {
    self, # TODO: probably don't need this
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs; # TODO: probably don't need this
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # VM 
      sequoia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
        ./hosts/sequoia
        ./modules/core
        ./modules/applications
        # ./modules/desktop/hyprland
        ./modules/desktop/awesome
	      ];
      };
      # Thinkpad X1 yoga
      redwood = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/redwood
          ./modules/core
          ./modules/applications
	        # ./modules/desktop/hyprland
	        ./modules/desktop/awesome
        ];
      };
      # GPD Win Mini
      cottonwood = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
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
        modules = [./home/home.nix];
      };
      "rain@redwood" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/home.nix];
      };
      "rain@cottonwood" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        modules = [./home/home.nix];
      };
    };
  };
}
