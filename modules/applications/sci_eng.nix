{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    solvespace
    imhex
    ghidra
    # imagej
    fiji
    cutter
    kicad
    alloy6
    tlaps
    tlaplusToolbox
    aflplusplus
    bioawk
    chirp
    pulseview
    sdrangel

    ## Security #TODO: Move some RE stuff down here
    sn0int
    py-spy

    ## RE

    ## BIO 
    python312Packages.biopython
  ];
}
