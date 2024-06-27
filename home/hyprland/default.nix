# home.nix

{ pkgs, lib, inputs, config, ... }:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar & '';
  in
{
  wayland.windowManager.hyprland = {
    enable = true;
     plugins = [
       #inputs.hyprland-plugins.packages."${pkgs.system}".
     ];


    settings = {
      exec-once = ''${startupScript}/bin/start'';
       general = {
         #layout = "scroller";
       };
      decoration = {

      };

      "$mod" = "SUPER";

      bind = [
      	    # Applications
      	"$mod, return, exec, kitty"
      	"$mod, d, exec, rofi -show drun"
      	"$mod, w, exec, rofi -show window"
      	"$mod, r, exec, rofi -show run"
      	"$mod, s, exec, rofi -show ssh"
      	"$mod, p, exec, rofi -show power"
	    	"$mod, C, killactive"
	    	"$mod, V, togglefloating"

	    	# Movement 
	    	"$mod, left, movefocus, l"
	    	"$mod, right, movefocus, r"
	    	"$mod, up, movefocus, u"
	    	"$mod, down, movefocus, d"
	    	"$mod, h, movefocus, l"
	    	"$mod, l, movefocus, r"
	    	"$mod, k, movefocus, k"
	    	"$mod, j, movefocus, j"

	    	# Workspaces 
	    	"$mod, 1, workspace, 1"
	    	"$mod, 2, workspace, 2"
	    	"$mod, 2, workspace, 2"
	    	"$mod, 3, workspace, 3"
	    	"$mod, 4, workspace, 4"
	    	"$mod, 5, workspace, 5"
	    	"$mod, 5, workspace, 6"
	    	"$mod, 6, workspace, 7"
	    	"$mod, 7, workspace, 8"
	    	"$mod, 9, workspace, 9"
	    	"$mod, 0, workspace, 10"

	    	# Workspace move
	    	"$mod SHIFT, 1, movetoworkspace, 1"
	    	"$mod SHIFT, 2, movetoworkspace, 2"
	    	"$mod SHIFT, 3, movetoworkspace, 3"
	    	"$mod SHIFT, 4, movetoworkspace, 4"
	    	"$mod SHIFT, 5, movetoworkspace, 5"
	    	"$mod SHIFT, 6, movetoworkspace, 6"
	    	"$mod SHIFT, 7, movetoworkspace, 7"
	    	"$mod SHIFT, 8, movetoworkspace, 8"
	    	"$mod SHIFT, 9, movetoworkspace, 9"
	    	"$mod SHIFT, 10, movetoworkspace, 10"

	    	# Scroll through existing workspaces
	    	"$mod, mouse_down, workspace, e+1"
	    	"$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
	   		"$mod, mouse:272, movewindow"
	   		"$mod, mouse:273, resizewindow"
      ];

    }; 
  };
}
