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

  let approx_years = total_days / 365.25
  let years = calc.floor(approx_years)
  let remaining_days = total_days - (years * 365.25)
  let months = calc.ceil(remaining_days / 30.44) // round months up

  if months >= 12 {
    years = years + 1
    months = 0
  }

  let parts = ()

  if years > 0 {
    if years == 1 {
      parts.push(str(years) + "yr")
    } else {
      parts.push(str(years) + "yrs")
    }
  }

  if months > 0 {
    if months == 1 {
      parts.push(str(months) + "mo")
    } else {
      parts.push(str(months) + "mos")
    }
  }

  if parts.len() == 0 {
    return "<1mo"
  }

  return parts.join(" ")
}

#let _term(start: none, end: datetime.today(), short: false) = {
  let format = "[month repr:short] [year]"
  if short { format = "[year]" }

  if start != none and start != datetime.today() {
    datetime.display(start, format)
    if short == false { text(" -- ") } else { text(" - ") }
    if end == datetime.today() {
      text("Present")
    } else {
      datetime.display(end, format)
    }
    if short == false {
      text[ · _(#_duration_to_text(end - start))_]
    }
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

#let organization(
  title: [],
  org: [],
  period: (
    start: none,
    end: datetime.today(),
  ),
  desc,
) = [
  === #title \
  #set text(size: text_10.small)
  #icon("people-group") #org
  #h(1fr)
  #_term(..period, short: true) \
  #desc
]

#let tag(skill) = {
  box(
    stroke: none,
    inset: (right: 0.2em, y: 0.3em),
    box(
      inset: (x: 0.4em),
      outset: (y: 0.4em),
      stroke: (
        thickness: 0.3pt,
        paint: colors.gray_500,
      ),
      radius: 3pt,
      text(size: text_10.small, skill),
    ),
  )
}

#let format_number(num) = {
  let suffixes = ("", "k", "M", "B", "T")
  let tier = calc.floor(calc.log(num, base: 1000))
  let scaled = num / calc.pow(1000, tier)
  let suffix = suffixes.at(tier)

  // handle numbers less than 1000
  if tier == 0 {
    return str(num)
  }

  // round to 1 decimal place
  let formatted = calc.round(scaled, digits: 1)
  let str_num = str(formatted)

  // remove .0 if present
  if str_num.ends-with(".0") {
    str_num = str_num.substring(0, str_num.len() - 2)
  }

  return str_num + suffix
}

#let github_card(org, repo, desc: "") = {
  let meta = json("gh-metadata/" + org + "_" + repo + ".json")
  box(
    radius: 3pt,
    inset: 0.3em,
    width: 100%,
  )[
    #if desc != "" {
      desc + " in"
    }
    #h(space.small)
    #box[#link(
        github_href(org, repo: repo),
      )[#icon("book-bookmark")*#meta.full_name*]] \
    #text(colors.gray_700)[#meta.description] \

    #(
      [#dot() #h(space.verysmall) #meta.language],
      [#icon("star") #format_number(meta.stargazers_count)],
      [#icon("code-fork") #meta.forks_count],
    ).join(h(space.big))
  ]
}

#let max_rating = 5
#let skill(name, rating) = {
  let done = false
  let i = 1

  name

  h(1fr)

  while (not done) {
    let colour = colors.gray_300

    if (i <= rating) {
      colour = colors.gray_950
    }

    box(
      circle(
        radius: 4pt,
        fill: colour,
      ),
    )

    if (max_rating == i) {
      done = true
    } else {
      // no spacing on last
      h(2pt)
    }

    i += 1
  }

  [\ ]
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
