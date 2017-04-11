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
    rev = "a6d78e482a3f8e7f144eb329b3cf22c00b4ee065";
    sha256 = "17yx3cgvrzbl0rjy1j7h9dy0avg0728zr5nk50llbrs0sw658ncl";
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
