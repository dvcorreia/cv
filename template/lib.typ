#let text_10 = (
  tiny: 5pt,
  scriptsize: 7pt,
  footnotesize: 8pt,
  small: 9pt,
  normal: 10pt,
  large: 12pt,
  Large: 14.4pt,
  LARGE: 17.28pt,
  huge: 20.74pt,
  Huge: 24.88pt,
)

#let space = (
  verysmall: 1.5pt,
  small: 3pt,
  med: 6pt,
  big: 12pt,
  huge: 24pt,
  veryhuge: 48pt,
  humongous: 96pt,
)

#let colors = (
  gray_950: rgb("#0a0a0a"),
  gray_900: rgb("#171717"),
  gray_800: rgb("#262626"),
  gray_700: rgb("#404040"),
  gray_600: rgb("#525252"),
  gray_500: rgb("#737373"),
  gray_400: rgb("#a3a3a3"),
  gray_300: rgb("#d4d4d4"),
)

#let https(ref) = {
  "https://" + ref
}

#let github_href(org, repo: "") = {
  if repo == none {
    https("github.com/" + org)
  } else {
    https("github.com/" + org + "/" + repo)
  }
}

#let capitalize(str) = {
  if str == "" { return str }
  upper(str.slice(0, 1)) + str.slice(1)
}

#let icon(
  name,
  collection: "solid",
  shift: space.verysmall,
  height: text_10.normal,
) = {
  box(
    baseline: shift,
    height: height,
    image("vendor/icons/" + collection + "/" + name + ".svg"),
  )
  h(space.small)
}
