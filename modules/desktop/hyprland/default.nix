{config, lib, pkgs, inputs, ...} : {
    imports = [

    ];
    environment.systemPackages = with pkgs; [
        waybar
        dunst
        libnotify
        swww
    ];

    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };
     
    hardware = {
        opengl.enable = true;
        nvidia.modesetting.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
}