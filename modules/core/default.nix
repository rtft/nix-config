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
    

    # TODO: Find the better of the two of these programs
    lsd
    eza
    
    
    
    # Shell
    nushell
    starship
    xonsh
    zsh

  ];
}
