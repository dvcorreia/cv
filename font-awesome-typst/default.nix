{
  buildTypstPackage,
  font-awesome-icons,
}:

buildTypstPackage {
  pname = "font-awesome";
  version = "7.0.0";
  src = ./.;

  postInstall = ''
    cp -r ${font-awesome-icons}/svgs "$out/lib/typst-packages/font-awesome/7.0.0/svgs"
  '';
}
