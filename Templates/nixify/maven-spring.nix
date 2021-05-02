with import <nixpkgs> { };
mkShell {
  nativeBuildInputs = [ bashInteractive ];
  buildInputs = [ spring-boot maven jdk ];
}
