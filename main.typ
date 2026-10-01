#import "template/cv.typ": (
  cv, education, experience, github_card, hrule, organization, skill, tag,
)
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
    location: "Remote to Zug, Switzerland",
  )[
    Part of the #code-siemens team, building and operating developer platforms shaped by Siemens developers’ needs and feedback.

    // Part of the #code-siemens team, contributing across multiple projects in what the Siemens developers need and find important.

    #let siemens-ai-post = link(
      "https://blog.siemens.com/2025/10/our-sovereign-ai-journey-building-a-self-contained-sustainable-and-cost-effective-llm-platform/",
      "open weight AI models",
    )

    - Work through incoming issues, contributing internally and upstream
    - Host #gitlabce and #siemens-ai-post for everyone at #siemens
    - Help people across Siemens access identity data and automate security risk detection
    - Improve Kubernetes infrastructure supporting internal services
    - Drive upstream-first mindset and open source work practices
  ]

  #tag(python) #tag(django) #tag(go) #tag(terraform) #tag(k8s) #tag(ansible)

  #hrule()

  #experience(
    title: "Software Engineer",
    company: metacell,
    period: (
      start: datetime(day: 1, month: 6, year: 2024),
      end: datetime(day: 23, month: 4, year: 2025),
    ),
    location: "Remote to Cambridge, US",
  )[
    Worked on neuroscience applications for research institutes and companies across the life sciences.

    - Maintained #neuroglass and codebases like #ohif, Google's #neuroglancer and #nvidia's #monailabel server

    #tag(python) #tag(django) #tag(typescript) #tag(reactjs)
  ]

  #hrule()

  #experience(
    title: "Product Technical Lead",
    company: wavecom,
    period: (
      start: datetime(day: 1, month: 12, year: 2022),
      end: datetime(day: 1, month: 6, year: 2024),
    ),
    location: "Aveiro, Portugal",
  )[
    Led the technical design and hands-on development of the #rtls and #uhf #rfid products. Ensured quality and cohesion throughout development, promoting engineering best practices across the team. Contributed to standardization efforts through the #omlox consortium.

    // Shaped the technical direction of the #rtls and #uhf #rfid products as their lead engineer.

    // - Ensured cohesion and quality over the lifecycle of the product and infused engineering best practices throughout the team
    // - Worked in the #rtls standardization effort in the #omlox consortium

    #tag(go) #tag(typescript) #tag(reactjs) #tag(k8s)
  ]

  #v(space.med)

  #experience(
    title: "Software Engineer",
    company: wavecom,
    period: (
      start: datetime(day: 1, month: 4, year: 2021),
      end: datetime(day: 1, month: 12, year: 2022),
    ),
    location: "Aveiro, Portugal",
  )[

    Built the software powering one of Europe’s largest RTLS deployments at the time, delivered by the team for Continental AG and handling over 7,500 position updates per second.

    #tag(go) #tag(python) #tag(java) #tag(k8s)
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
  #tag(django)
  #tag(typescript)
  #tag(reactjs)
  #tag(nix)
  #tag(wasm)

  #hrule()

  #tag(k8s)
  #tag[#docker]
  #tag(helm)
  #tag(postgres)
  #tag(terraform)
  #tag[GitLab CI/CD]
  #tag[Envoy]

  == Projects

  #github_card("wavecomtech", "omlox-client-go")
  #hrule()
  #github_card("NixOS", "nixpkgs", desc: "Package maintainer")

  == Languages

  #skill("Portuguese (Native)", 5)
  #skill("English (C1)", 4.5)

  == Organizations

  #organization(
    title: "Vice President",
    org: hardwarecity,
    period: (
      start: datetime(day: 1, month: 10, year: 2023),
    ),
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
