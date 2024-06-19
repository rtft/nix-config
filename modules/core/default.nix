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
    python311Packages.yfinance
    python311Packages.numpy
    python311Packages.simpy
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
    pandoc
    ffmpeg_7-full
    gawk
    lnav
    dust 
    sd
    procs
    tldr
    rsync
    openssh
    criu
    curl 
    wget
    broot
    tokei
    plan9port
    rm-improved
    hexyl
    pijul
    docker 
    gdb
    thefuck
    sqlite
    rink
    frink

    #TODO: This needs to be set up as a service probably
    # iodine

    emacs
    

    # TODO: Find the better of the two of these programs
    lsd
    eza
    
    ## Debug tools 
    procps
    util-linux
    sysstat 
    iproute2
    numactl 
    tcpdump
    trace-cmd
    ethtool
    tiptop
    cpuid
    msr-tools
    nmap

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

  stylix.enable = true;
  stylix.image = ../assets/test_wallpaper.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";

}
