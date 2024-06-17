# home.nix

{ pkgs, lib, inputs, config, ... }:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar & '';
  in
{
  wayland.windowManager.hyprland = {
    enable = true;
    # plugins = [
    #   inputs.hyprland-plugins.packages."${pkgs.system}".hyprscroller
    # ];


    settings = {
      exec-once = ''${startupScript}/bin/start'';
      general = {
        layout = "scroller";
      };
    };
  };
}