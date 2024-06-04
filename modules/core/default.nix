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
    python311Packages.pandas
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
    xplr
    bottom

    #TODO: This needs to be set up as a service probably
    # iodine

    emacs
    

    # TODO: Find the better of the two of these programs
    lsd
    eza
    
    
    
    # Shell
    nushell
    starship
    xonsh
    zsh

  ];
  # ++
  # (with pkgs-unstable; [
  #   emacs
  # ]);

  programs.xonsh.enable = true;
  users.defaultUserShell = pkgs.xonsh;
}
