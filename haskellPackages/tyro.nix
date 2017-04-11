{ mkDerivation, fetchFromGitHub, aeson, base, HUnit, protolude, singletons, stdenv
, test-framework, test-framework-hunit, text, reflection
}:
mkDerivation {
  pname = "tyro";
  version = "0.1.1.0";
  src = fetchFromGitHub { 
    owner = "rlupton20";
    repo = "tyro";
    rev = "v0.2";
    sha256 = "006lhb44dh0pv4f95141sfk0dvr7xwk4ggmp45i7hdsf8cnlridp";
  };
  libraryHaskellDepends = [ aeson base protolude singletons text reflection ];
  testHaskellDepends = [
    aeson base HUnit protolude test-framework test-framework-hunit text
  ];
  homepage = "https://github.com/rlupton20/tyro#readme";
  description = "Type derived JSON parsing using Aeson";
  license = stdenv.lib.licenses.bsd3;
}
