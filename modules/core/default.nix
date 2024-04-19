{
  config, lib, pkgs, home-manager, ...
}:
{
  imports = [
    ./terminal
    ./nix/home.nix
  ];
  environment.systemPackages = with pkgs; [
    picat
    python3
    distrobox
    zellij
    ripgrep
    fd
    bat
    fzf
    git
    neovim
    helix
    nushell
    starship
    xonsh
    zsh

    # TEMP 
    alacritty
    
  ];
}