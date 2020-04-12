let 
  pkgs = import <nixpkgs> {};
in
pkgs.stdenv.mkDerivation {
  name = "unruu-0.1";
  src = ./.; 
  buildInputs = with pkgs; [ pkg-config libtool bash autoconf automake unshield ];
  preConfigure = ''
    autoreconf -fsi
  '';
  buildPhase = ''
    make
  '';
}
