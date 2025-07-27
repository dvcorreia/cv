#import "template/cv.typ": cv, experience, chronology, education, organization, github_card, tag, skill, hrule
#import "template/lib.typ": *
#import "alias.typ": *

#show: cv.with(
  name: "Diogo Vala Correia",
  photo: image("photos/me3.jpg"),
  info: (
    email: "dv_correia@hotmail.com",
    phone: "+351 915800676",
    location: "Aveiro, Portugal",
    homepage: "dvcorreia.com",
    linkedin: "diogovalacorreia",
    github: "dvcorreia",
  ),
)

#grid(
  columns: (60%, auto),
  gutter: 20pt,
)[
  == Experience

  #experience(
    title: "Senior Open-Source Engineer",
    company: siemens,
    period: (
      start: datetime(day: 22, month: 5, year: 2025),
      end: datetime.today(),
    ),
    location: "Lisbon, Portugal",
  )[
    Working in the #code-siemens team, improving developer experience, advocating for open source culture and contributing to open-source projects strategic to #siemens.
  ]

  #hrule

  #experience(
    title: "Software Engineer",
    company: metacell,
    period: (
      start: datetime(day: 1, month: 6, year: 2024),
      end: datetime(day: 23, month: 4, year: 2025),
    ),
    location: "Remote to Cambridge, US",
  )[
    Worked on neuroscience #saas products and applications for research institutes, pharmaceutical companies and clinics.

    - Maintain internal forks of open source projects like #ohif, Google's #neuroglancer and #nvidia's #monailabel server
    - Full-stack development of solutions to analyze and serve large research data (#celegans and #esckan projects)

    #tag(python) #tag(typescript) #tag(reactjs)
  ]

  #hrule

  #chronology(
    company: wavecom,
    duration: "3yrs 3mos",
  )[
    #experience(
      title: "Product Technical Lead",
      company: wavecom,
      period: (
        start: datetime(day: 1, month: 12, year: 2022),
        end: datetime(day: 1, month: 6, year: 2024),
      ),
      location: "Aveiro, Portugal",
    )[
      Oversee the technical direction for the real-time location systems (#rtls) products and team.

      - Co-led an 8-person cross-functional Scrum team, together with a Project Manager and a Product Owner
      - Ensured cohesion and quality over the lifecycle of the product and infused engineering best practices throughout the team
      - Worked in the #rtls standardization effort with the #omlox consortium, part of the #profibus

      #tag(go) #tag(typescript) #tag(reactjs) #tag(k8s)
    ]
  ][
    #experience(
      title: "Software Engineer",
      company: wavecom,
      period: (
        start: datetime(day: 1, month: 4, year: 2021),
        end: datetime(day: 1, month: 12, year: 2022),
      ),
      location: "Aveiro, Portugal",
    )[
      Worked on real-time location systems (#rtls) and ultra-high frequency radio identification (#uhf #rfid) products for industry and healthcare.

      - Transformed an initial prototype into a robust, production-grade platform, adaptable to any use case and capable of processing packets from thousands of BLE and UWB devices

      #tag(go) #tag(python) #tag(java) #tag(k8s)
    ]
  ]
][
  == Education

  #education(
    degree: [B.Sc. and M.Sc. in #et],
    institution: ua,
    period: "2014 - 2020",
  )[
    // Dissertation: #emph["#epcglobal Architecture:
    // Smart Shelf Implementation for Retail Inventory Management"]
  ]

  #education(
    degree: "Exchange Student",
    institution: polito,
    period: "2018 - 2019",
  )[
    #icts with focus on automotive, IoT applications and machine learning.
  ]

  == Skills & Tools

  #tag(go)
  #tag(python)
  #tag(typescript)
  #tag(reactjs)
  #tag(nix)
  #tag(wasm)

  #hrule

  #tag(k8s)
  #tag[#docker / #podman]
  #tag(helm)
  #tag(postgres)

  == Projects

  #github_card("wavecomtech", "omlox-client-go")
  #hrule
  #github_card("NixOS", "nixpkgs", desc: "Package maintainer")

  == Languages

  #skill("Portuguese (Native)", 5)
  #skill("English (C1)", 4.5)

  == Organizations

  #organization(
    title: "Vice President",
    org: hardwarecity,
    period: (
      start: datetime(day: 1, month: 10, year: 2023)
    )
  )[
    Create an open and sustainable community around product development.
  ]

  // #organization(
  //   title: "Logistics",
  //   org: eestec,
  //   period: (
  //     start: datetime(day: 1, month: 12, year: 2019),
  //     end: datetime(day: 1, month: 12, year: 2020)
  //   )
  // )[#tag[Workshops]]

  // #organization(
  //   title: "Electronics and Electric Powertrain",
  //   org: engenius,
  //   period: (
  //     start: datetime(day: 1, month: 10, year: 2017),
  //     end: datetime(day: 1, month: 9, year: 2019)
  //   )
  // )[#tag[CAN Bus] #tag[BMS Systems]]
]
