#import "lib.typ": *

#let main_font = "Roboto Slab"
#let sans_font = "Lato"

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
    (
      linkedin,
      _info(
        linkedin,
        href: https("www.linkedin.com/in/" + linkedin + "/"),
        icon: icon("linkedin", collection: "brands"),
      ),
    ),
    (
      github,
      _info(
        github,
        href: github_href(github),
        icon: icon("github", collection: "brands"),
      ),
    ),
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

#let chronology(
  company: none,
  employment_type: "Full-time",
  duration: "",
  ..experiences,
) = {
  experiences.pos().join(v(space.med))
}

#let _duration_to_text(duration) = {
  let total_days = duration.days()
  let total_months = calc.round(total_days / 30.44)
  let years = calc.floor(total_months / 12)
  let months = total_months - (years * 12)

  let parts = ()
  if years > 0 and years <= 1 { parts.push(str(years) + "yr") }
  if years > 1 { parts.push(str(years) + "yrs") }
  if months > 0 and months <= 1 { parts.push(str(months) + "mo") }
  if months > 1 { parts.push(str(months) + "mos") }

  if parts.len() == 0 { return "<1mo" }
  parts.join(" ")
}

#let _term(start: none, end: datetime.today(), short: false) = {
  let format = "[month repr:short] [year]"
  if short { format = "[year]" }

  if start != none and start != datetime.today() {
    datetime.display(start, format)
    text(" -- ")
    if end == datetime.today() {
      text("Present")
    } else {
      datetime.display(end, format)
    }
    text[ · _(#_duration_to_text(end - start))_]
  }
}

#let experience(
  title: [],
  company: [],
  period: (
    start: none,
    end: datetime.today(),
  ),
  location: "",
  desc,
) = [
  === #title \
  #if company != none [#company \ ]
  #text(size: text_10.small)[
    #icon("calendar")
    #_term(..period)
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
  set text(text_10.normal, font: sans_font)
  set page(margin: (x: 1.25cm, y: 1.5cm))

  show heading.where(level: 2): it => text(
    size: text_10.LARGE,
    font: main_font,
  )[
    #upper(it.body)
    #v(-15pt)
    #line(length: 100%, stroke: 2pt)
  ]

  show heading.where(level: 3): it => text(
    size: text_10.large,
    font: main_font,
    it.body,
  )

  table(
    columns: (80%, 20%),
    stroke: none,
    inset: 0pt,
    {
      text(text_10.Huge, font: main_font)[
        #upper[#strong(name)]
      ]
      block(spacing: 1.8em, _personal_info(..info))
      v(space.big)
    },
    {
      if photo != none {
        align(right, _profile_photo(photo))
      }
    },
  )

  doc
}
