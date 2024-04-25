{config, lib, pkgs, ...}:
{
  environment.systemPackages =  with pkgs; [

    # Creative programs
    blender
    reaper


    # Gaming 
    steam
    dolphin-emu

    
    
  ];
  programs.steam.enable = true;
}
