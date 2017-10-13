self: super:
let
  callPackage = super.lib.callPackageWith (super // self);
  unstable = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {};

  haskellLibraries = {
    concurrentStack = super.haskellPackages.callPackage ./haskellPackages/concurrent-stack.nix {};
    haskellEtcd = super.haskellPackages.callPackage ./haskellPackages/haskell-etcd.nix {};
    treeThreads = super.haskellPackages.callPackage ./haskellPackages/tree-threads.nix {};
    tyro = super.haskellPackages.callPackage ./haskellPackages/tyro.nix {};
  };

  vanguard = {
    vanguardCore = super.haskellPackages.callPackage ./vanguard/vanguard-core.nix {};
  };

  miniTools = {
    csv = unstable.lib.callPackagesWith (unstable // self) ./miniTools/csv.nix {};
  };

  # NixOS modules
  nixos = {
    modules = import ./nixos-modules;
  };

  obelisk = {
    # Packages
    haskellLibraries = haskellLibraries;
    vanguard = vanguard;
    miniTools = miniTools;

    # NixOS modules
    nixos = nixos;
  };
in 
{ 
  obelisk = obelisk; 
}
