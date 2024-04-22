{
  config, lib, pkgs, ...
}:
{
  imports = [

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

  ];
}
