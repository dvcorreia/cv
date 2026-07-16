#let icon-path(name, collection: "solid") = (
  "svgs/" + collection + "/" + name + ".svg"
)

#let icon-image(name, collection: "solid", ..args) = image(
  icon-path(name, collection: collection),
  ..args,
)
