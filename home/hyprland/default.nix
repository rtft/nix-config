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
      # general = {
      #   layout = "scroller";
      # };
      decoration = {

      };

      "$mod" = "SUPER";

      bind = [
            "$mod, return, exec, kitty"
            "$mod, d, exec, rofi -show drun"
            "$mod, w, exec, rofi -show window"
            "$mod, q, exec, killall -9 waybar"
            "$mod, r, exec, rofi -show run"
            "$mod, c, exec, rofi -show calc"
            "$mod, s, exec, rofi -show ssh"
            "$mod, e, exec, rofi -show emoji"
            "$mod, p, exec, rofi -show power"
      ];

    }; 
  };
}