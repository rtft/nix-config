{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    plugins = {

    };
    extraPlugins = with pkgs.vimPlugins; [

    ];
  };
}
