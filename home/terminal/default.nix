{pkgs, lib, config, ...}:
{
  #programs.xonsh = {
  #  enable = true; 
  #};
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
  };

  programs.nushell = {
    enable = true;
  };

}
