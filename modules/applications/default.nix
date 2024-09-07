{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./heavy.nix
    ./sci_eng.nix
    ./programming.nix
  ];
  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    floorp
    wezterm
    pciutils

    libsForQt5.dolphin
    calibre
    mpv
    anki
    nsxiv
    audacity
    hydrus

    rofi-wayland
    vscode-fhs
    #zed-editor
    spotify
    discord
    flameshot
    ollama
    wdisplays
    arandr
    kanshi

    neovide
    rustdesk
    nyxt
  ];
}
