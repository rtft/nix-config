{config, lib, pkgs, ...}:
{
  imports = [
    ./heavy.nix
  ];
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
    audacity
    
    rofi-wayland
    vscode-fhs    
    spotify 
    discord 
    
  ];
}
