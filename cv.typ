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
  if repo == "" {
    https("github.com/" + org)
  } else {
    https("github.com/" + org + "/" + repo)
  }
}

#let icon(name, collection: "solid", shift: space.verysmall) = {
  box(
    baseline: shift,
    height: text_10.normal,
    image("dist/icons/" + collection + "/" + name + ".svg"),
  )
  h(space.small)
}

#let personal_info_link(
  display,
  href: "",
  icon: [],
) = {
  box({
    icon

    if link == "" {
      display
    } else {
      link(href)[#display]
    }
  })
}

#let personal_info(
  email: "",
  phone: "",
  location: "",
  homepage: "",
  linkedin: "",
  github: "",
) = {
  set text(text_10.footnotesize)
  let icon = icon.with(shift: 2.5pt)

  (
    if email != "" {
      personal_info_link(email, href: "mailto:" + email, icon: icon("at"))
    },
    if phone != "" {
      personal_info_link(phone, icon: icon("phone-flip"))
    },
    if location != "" {
      personal_info_link(location, icon: icon("location-pin"))
    },
    if homepage != "" {
      personal_info_link(homepage, href: https(homepage), icon: icon("globe"))
    },
    if linkedin != "" {
      personal_info_link(
        linkedin,
        href: https("www.linkedin.com/in/" + linkedin + "/"),
        icon: icon("linkedin", collection: "brands"),
      )
    },
    if github != "" {
      personal_info_link(
        github,
        href: github_href(github),
        icon: icon("github", collection: "brands"),
      )
    },
  ).join(h(space.big))
}

#let profile_photo(photo) = {
  box(
    clip: true,
    radius: 50%,
    image("dist/photos/" + photo, height: 2.8cm, width: auto),
  )
}

#let hrule = [
  #line(length: 100%, stroke: (dash: "dashed", thickness: 0.6pt))
]

#let term(period, location) = {
  text(text_10.small)[#icon("calendar") #period #h(1fr) #icon("location-pin") #location]
}

#let experience(title: [], company: [], period: "", location: "", desc) = [
  === #title \
  #company \
  #text(text_10.small)[#icon("calendar") #period #h(1fr) #icon("location-pin") #location]

  #desc
]

#let education(degree: [], institution: [], period: "", desc) = [
  ==== #degree \
  #set text(size: text_10.small)
  #icon("building-columns") #institution #h(1fr) #icon("calendar") #period

  
  #desc
]

#let tag(skill) = {
  let stroke = 0.3pt + colors.gray_500
  set text(stroke: stroke)
  box(
    stroke: none,
    inset: (right: 0.2em, y: 0.3em),
    box(
      inset: (x: 0.4em),
      outset: (y: 0.4em),
      stroke: stroke,
      radius: 3pt,
      skill,
    )
  )
}



#let cv(
  name: "",
  photo: "",
  info: (
    email: "",
    phone: "",
    location: "",
    homepage: "",
    linkedin: "",
    github: "",
    gitlab: "",
  ),
  doc,
) = {
  set text(text_10.normal, font: "Roboto Slab")
  set page(margin: (x: 1.25cm, y: 1.5cm))
  set list(marker: [•])

  show heading.where(
    level: 2
  ): it => text(
    size: text_10.LARGE
  )[
    #upper(it.body)
    #v(-15pt)
    #line(length: 100%, stroke: 2pt)
  ]

  show heading.where(
    level: 3
  ): it => text(
    size: text_10.large,
    it.body
  )

  // make header
  table(
    columns: (80%, 20%),
    stroke: none,
    inset: 0pt,
    {
      text(text_10.Huge)[
        #upper[*#name*]
      ]
      block(spacing: 1.8em, personal_info(..info))
    },
    {
      align(right, profile_photo(photo))
    },
  )

  doc
}
