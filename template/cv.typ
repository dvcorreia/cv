#import "chronology.typ": chronology
#import "lib.typ": *

#let _info(
  display,
  href: "",
  icon: none,
) = {
  box({
    if icon != none { icon }
    if href == "" {
      display
    } else {
      link(href)[#display]
    }
  })
}

#let _personal_info(
  email: "",
  phone: "",
  location: "",
  homepage: "",
  linkedin: "",
  github: "",
) = {
  set text(text_10.footnotesize)
  let icon = icon.with(shift: 2.5pt)

  let ifdef(i) = {
    let (v, o) = i
    if v != "" { o }
  }

  let items = (
    (email, _info(email, href: "mailto:" + email, icon: icon("at"))),
    (phone, _info(phone, icon: icon("phone-flip"))),
    (location, _info(location, icon: icon("location-pin"))),
    (homepage, _info(homepage, href: https(homepage), icon: icon("globe"))),
    (linkedin, _info(
      linkedin,
      href: https("www.linkedin.com/in/" + linkedin + "/"),
      icon: icon("linkedin", collection: "brands"),
    )),
    (github, _info(
      github,
      href: github_href(github),
      icon: icon("github", collection: "brands"),
    )),
  )
  
  items.map(ifdef).join(h(space.big))
}

#let _profile_photo(photo) = {
  box(
    clip: true,
    radius: 50%,
    height: 2.8cm,
    width: auto,
    photo,
  )
}

#let hrule = line(length: 100%, stroke: (dash: "dashed", thickness: 0.6pt))

#let experience(title: [], company: none, period: "", location: "", desc) = [
  === #title \
  #if company != none [#company \ ]
  #text(size: text_10.small)[
    #icon("calendar") #period
    #h(1fr)
    #icon("location-pin") #location
  ]

  #desc
]

#let education(degree: [], institution: [], period: "", desc) = [
  ==== #degree \
  #set text(size: text_10.small)
  #icon("building-columns") #institution
  #h(1fr)
  #icon("calendar") #period

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
    ),
  )
}

#let cv(
  name: "",
  photo: none,
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

  show heading.where(level: 2): it => text(size: text_10.LARGE)[
    #upper(it.body)
    #v(-15pt)
    #line(length: 100%, stroke: 2pt)
  ]

  show heading.where(level: 3): it => text(
    size: text_10.large,
    it.body,
  )

  table(
    columns: (80%, 20%),
    stroke: none,
    inset: 0pt,
    {
      text(text_10.Huge)[
        #upper[#strong(name)]
      ]
      block(spacing: 1.8em, _personal_info(..info))
      v(space.huge)
    },
    {
      if photo != none {
        align(right, _profile_photo(photo))
      }
    },
  )

  doc
}
