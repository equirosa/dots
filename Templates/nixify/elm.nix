with import <nixpkgs> { };
mkShell {
  nativeBuildInputs = [
    bashInteractive
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
    elmPackages.elm-language-server
  ];
}
