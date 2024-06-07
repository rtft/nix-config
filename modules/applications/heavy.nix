{config, lib, pkgs, ...}:
{
  environment.systemPackages =  with pkgs; [

    # Creative programs
    blender
    reaper
    godot_4
    aseprite
    krita


    # Gaming 
    steam
    dolphin-emu

    # Virtualization 
    qemu 
    virt-manager 
    
  ];
  programs.steam.enable = true;
}
