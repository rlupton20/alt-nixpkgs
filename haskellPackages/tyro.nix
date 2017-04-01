{ mkDerivation, fetchFromGitHub, aeson, base, HUnit, protolude, singletons, stdenv
, test-framework, test-framework-hunit, text
}:
mkDerivation {
  pname = "tyro";
  version = "0.1.1.0";
  src = fetchFromGitHub { 
    owner = "rlupton20";
    repo = "tyro";
    rev = "v0.1.1";
    sha256 = "14pk5qmmlwfby5fqnwyj9pyy22sffq8vd5kkp4sma2vyqn6vv2hl";
  };
  libraryHaskellDepends = [ aeson base protolude singletons text ];
  testHaskellDepends = [
    aeson base HUnit protolude test-framework test-framework-hunit text
  ];
  homepage = "https://github.com/rlupton20/tyro#readme";
  description = "Type derived JSON parsing using Aeson";
  license = stdenv.lib.licenses.bsd3;
}
