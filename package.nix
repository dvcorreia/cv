{
  lato,
  roboto-slab,
  buildTypstDocument,
  font-awesome-typst,
}:

buildTypstDocument {
  pname = "diogo-correia-cv";
  version = "1.0";

  src = ./.;
  file = "main.typ";

  typstEnv = _: [ font-awesome-typst ];

  fonts = [
    lato
    roboto-slab
  ];
}
