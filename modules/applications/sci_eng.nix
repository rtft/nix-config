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
    bioawk

    ## Security #TODO: Move some RE stuff down here
    sn0int 
    py-spy
  ];
}
