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
      decoration = {

      };
      bindm = [
        {
          key = "Mod4";
          value = {
            "Return" = "kitty";
            "d" = "rofi -show drun";
            "w" = "rofi -show window";
            "q" = "killall -9 waybar";
            "r" = "rofi -show run";
            "c" = "rofi -show calc";
            "s" = "rofi -show ssh";
            "e" = "rofi -show emoji";
            "p" = "rofi -show power";
          };
        }
      ];

    }; 
  };
}