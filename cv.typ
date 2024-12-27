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

#let term(period, location) = {
  text(text_10.small)[#icon("calendar") #period #h(1fr) #icon("location-pin") #location]
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
