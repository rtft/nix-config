{pkgs, lib, config, ...}:
{
    programs.helix = {
       enable = true;

       settings = {
       	   # Temporary solution while I fix stylix
           theme = lib.mkForce "monokai_pro_spectrum";
       };
    };
}
