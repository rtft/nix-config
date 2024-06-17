{config, lib, pkgs, ...}:
{
   environment.systemPackages = with pkgs; [
    hy
    elixir
    julia
    swiProlog
    crystal
    zig
    rustc
    rustup 
    rustfmt
    mercury 
    idris2
    gleam
    nim
    futhark 
    go
    j
    uiua
    supercollider
    coconut
    nodejs_22
   ];
}