{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  haskellLibraries = {
    concurrentStack = pkgs.haskellPackages.callPackage ./haskellPackages/concurrent-stack.nix {};
    haskellEtcd = pkgs.haskellPackages.callPackage ./haskellPackages/haskell-etcd.nix {};
    treeThreads = pkgs.haskellPackages.callPackage ./haskellPackages/tree-threads.nix {};
    tyro = pkgs.haskellPackages.callPackage ./haskellPackages/tyro.nix {};
  };

  vanguard = {
    vanguardCore = pkgs.haskellPackages.callPackage ./vanguard/vanguard-core.nix {};
  };

  toolsets = import ./toolsets/toolsets.nix {};

  self = {
    haskellLibraries = haskellLibraries;
    vanguard = vanguard;
    toolsets = toolsets;
  };


in
(pkgs // self)
