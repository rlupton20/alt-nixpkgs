{ mkDerivation, fetchFromGitHub, aeson, base, bytestring, data-default, exceptions
, free, http-conduit, HUnit, protolude, singletons, stdenv
, test-framework, test-framework-hunit, text
}:
mkDerivation {
  pname = "haskell-etcd";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "rlupton20";
    repo = "haskell-etcd";
    rev = "a684a1a3eaf6ab17added3fc2ad23a2493b7679d";
    sha256 = "19gpcahrwc97jvlf0h7n3i07p5h3hwyh8xzpzz369x26l7x9hi8z";
  };
  libraryHaskellDepends = [
    aeson base bytestring data-default exceptions free http-conduit
    protolude singletons text
  ];
  testHaskellDepends = [
    aeson base bytestring HUnit protolude test-framework
    test-framework-hunit text
  ];
  homepage = "https://github.com/githubuser/haskell-etcd#readme";
  license = stdenv.lib.licenses.lgpl3;
}
