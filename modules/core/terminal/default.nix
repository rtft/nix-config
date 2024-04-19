{pkgs, lib, config, ...}:
{
  programs.xonsh = {
    enable = true; 
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  programs.nushell = {
    enable = true;
  };

}