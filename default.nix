{ system ? builtins.currentSystem }:

let
  obelisk = import ./overlay.nix;
  pkgs = import <nixpkgs> { inherit system; overlays = [ obelisk ]; };
in
  pkgs.obelisk
