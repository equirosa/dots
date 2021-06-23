with import <nixpkgs> { };
mkShell {
  nativeBuildInputs = [
    bashInteractive
    nodejs
    #nodejs-10_x
    #nodejs-12_x
    #nodejs-16_x
  ];
}
