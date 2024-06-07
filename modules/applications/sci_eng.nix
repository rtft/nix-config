{config, lib, pkgs, ...}:
{
  environment.systemPackages =  with pkgs; [
    solvespace
    imhex
    ghidra
    imagej
    cutter
    kicad
    alloy6
    tlaps
    tlaplusToolbox
    aflplusplus
    frink
    rink
  ];
}
