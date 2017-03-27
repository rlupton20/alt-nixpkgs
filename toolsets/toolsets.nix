{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  unstable = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {};


  haskellToolset = let
    stack = pkgs.stack;
    ghc = pkgs.haskellPackages.ghcWithHoogle(packages: with packages; [
        happy
        hindent
        hasktags
        stylish-haskell
        ghc-mod
        hlint
      ]);
  in {
    inherit
    ghc
    stack;
  };


  rustToolset = let
    rustc = unstable.rustc;
    cargo = unstable.cargo;
    rustfmt = unstable.rustfmt;
    rustracer = unstable.rustracer; 
  in {
    inherit
    rustc
    cargo
    rustfmt
    rustracer;
  };


  toolsets = {
    haskellToolset = haskellToolset;
    rustToolset = rustToolset;
  };

in

toolsets
