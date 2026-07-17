// POC: data-driven CV renderer.
// Usage: typst compile --input data=poc/cv-data.json poc/render.typ out.pdf
// Reuses the existing template components; only the content is data-driven.

#import "/template/cv.typ": cv, education, experience, hrule, skill, tag
#import "/template/lib.typ": *

// Data can be supplied two ways:
//   --input json=<inline json string>   (used by the server; no temp file needed)
//   --input data=<root-relative path>   (used from the CLI, e.g. /poc/cv-data.json)
#let data = if "json" in sys.inputs {
  json(bytes(sys.inputs.json))
} else {
  json(sys.inputs.at("data", default: "/poc/cv-data.json"))
}

// Parse an ISO "YYYY-MM-DD" string into a datetime. "present"/none -> today.
#let parse_date(s) = {
  if s == none or s == "" or s == "present" {
    return datetime.today()
  }
  let parts = s.split("-")
  datetime(
    year: int(parts.at(0)),
    month: int(parts.at(1)),
    day: int(parts.at(2)),
  )
}

#show: cv.with(
  name: data.name,
  info: data.info,
)

#grid(
  columns: (60%, auto),
  gutter: 20pt,
)[
  == Experience

  #let exps = data.at("experience", default: ())
  #for (i, e) in exps.enumerate() {
    experience(
      title: e.title,
      company: e.at("company", default: none),
      period: (
        start: parse_date(e.at("start", default: none)),
        end: parse_date(e.at("end", default: none)),
      ),
      location: e.at("location", default: ""),
    )[
      #e.at("desc", default: "")

      #for t in e.at("tags", default: ()) [#tag(t) ]
    ]

    if i < exps.len() - 1 {
      hrule
    }
  }
][
  == Education

  #for ed in data.at("education", default: ()) {
    education(
      degree: ed.degree,
      institution: ed.at("institution", default: ""),
      period: ed.at("period", default: ""),
    )[#ed.at("desc", default: "")]
  }

  == Skills & Tools

  #for s in data.at("skills", default: ()) [#tag(s) ]

  == Languages

  #for l in data.at("languages", default: ()) {
    skill(l.name, l.rating)
  }
]
