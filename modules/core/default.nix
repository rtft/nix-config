{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    #./nvim.nix
  ];
  environment.systemPackages = with pkgs; [
    # TODO: probably best to seperate these packages into their own modules based on type
    # default programming environments without shell.nix
    picat
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.yfinance
      python-pkgs.numpy
      python-pkgs.simpy
      python-pkgs.ortools
    ]))
    #python311Packages.pandas
    #python311Packages.yfinance
    #python311Packages.numpy
    #python311Packages.simpy
    #python311Packages.ortools
    #python311Packages.cadquery
    ihaskell
    ghc

    # Terminal programs
    zellij
    ripgrep
    distrobox
    podman
    podman-tui
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
    lazygit

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
    yazi
  ];
  # ++
  # (with pkgs-unstable; [
  #   emacs
  # ]);

  programs.xonsh.enable = true;
  users.defaultUserShell = pkgs.xonsh;

  #TODO: Remove stylix from this flake

  stylix.enable = true;
  stylix.image = ../../assets/test_wallpaper.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
}
