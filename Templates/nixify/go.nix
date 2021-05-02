mkShell {
  nativeBuildInputs = [
    bashInteractive
    go
  ];
}
with import <nixpkgs> { };
