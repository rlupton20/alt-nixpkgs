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

  obelisk = {
    haskellLibraries = haskellLibraries;
    vanguard = vanguard;
    miniTools = miniTools;
  };
in 
{ 
  obelisk = obelisk; 
}
