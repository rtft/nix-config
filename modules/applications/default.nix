{config, lib, pkgs, home-manager, ...}:
{
  environment.systemPackages = with pkgs; [
    alacritty 
    kitty 
    floorp
  ];
}
