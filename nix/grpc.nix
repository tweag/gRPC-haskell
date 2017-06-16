{ pkgs, stdenv, lib, fetchgit, autoconf, automake, libtool, which, zlib, openssl
}:

stdenv.mkDerivation rec {
  name    = "grpc-${version}";
  version = "1.2.0-${lib.strings.substring 0 7 rev}";
  rev     = "3ce5d3af799336a862b470a1d4ed3770628e52da";
  src = fetchgit {
    inherit rev;
    url    = "https://github.com/grpc/grpc.git";
    sha256 = "1jjck2d5d9g6vq13a25bbrfx9wjm1qpzsl1ikiihvh1z0w2w94ii";
  };
  preInstall  = "export prefix";
  buildInputs =
    (if stdenv.isDarwin then [ pkgs.darwin.cctools ] else []) ++ [
    autoconf
    automake
    libtool
    which
    zlib
    openssl
  ];
}
