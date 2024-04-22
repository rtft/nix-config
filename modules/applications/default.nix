{config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    alacritty 
    kitty 
    floorp
    wezterm

    libsForQt5.dolphin
    calibre
    mpv
    anki
    nsxiv
    
    
    

    spotify 
    discord 
    
    # TODO: probably good to have a heavy programs module
    blender
    steam
    reaper
    
  ];
}
