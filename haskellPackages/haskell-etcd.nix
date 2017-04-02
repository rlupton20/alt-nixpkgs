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
    rev = "e331cf5c3c7fdc15620aa15df04d8bcd8e705856";
    sha256 = "0pkc8sjcbs1jaybxnsb09iiha1gpxgbsxzm5ddbrn49inbk87914";
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
