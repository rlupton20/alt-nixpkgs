{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };


  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    treeThreads = pkgs.haskellPackages.callPackage ./haskellPackages/tree-threads.nix {};
    concurrentStack = pkgs.haskellPackages.callPackage ./haskellPackages/concurrent-stack.nix {};
  };
in
(pkgs // self)
