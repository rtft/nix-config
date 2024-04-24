{
  config, lib, pkgs, ...
}:
{
  imports = [

  ];
  environment.systemPackages = with pkgs; [
    # TODO: probably best to seperate these packages into their own modules based on type
    # default programming environments without shell.nix
    picat
    python3
    #python311Packages.cadquery
    ihaskell
    ghc

    
    # Terminal programs
    zellij
    ripgrep
    distrobox
    fd
    bat
    fzf
    git
    neovim
    helix
    yt-dlp
    jq
    zoxide 
    emacs
    xplr
    bottom

    #TODO: This needs to be set up as a service probably
    iodine
    

    # TODO: Find the better of the two of these programs
    lsd
    eza
    
    
    
    # Shell
    nushell
    starship
    xonsh
    zsh

  ];

  programs.xonsh.enable = true;
  users.defaultUserShell = pkgs.xonsh;
}
