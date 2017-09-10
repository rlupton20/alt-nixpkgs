{ rustPlatform, stdenv, fetchFromGitHub }:
rustPlatform.buildRustPackage rec {
  name = "csv-${version}";
  version = "v0.1";

  src = fetchFromGitHub {
    owner = "rlupton20";
    repo = "csv";
    rev = "${version}";
    sha256 = "0fsn1a8lfxy3spblq2ydbms14bi8ydxwkbgqzvqjmraqbhr6320p";
  };

  depsSha256 = "1kj71wy5f5b5dfm4dyras3c1q88746gah09dny5jh8m07m5m4fna";

  meta = with stdenv.lib; {
    description = "A utility which makes it easy to filter CSV files";
    homepage = https://github.com/rlupton20/csv;
    license = with licenses; [ gpl3 ];
    platforms = platforms.all;
  };
}
