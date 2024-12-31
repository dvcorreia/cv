#import "template/cv.typ": cv, experience, chronology, education, github_card, tag, hrule
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
    title: "Software Engineer",
    company: metacell,
    period: (
      start: datetime(day: 1, month: 6, year: 2024),
      end: datetime.today(),
    ),
    location: "Remote to Cambridge, US",
  )[
    Working on neuroscience #saas products and applications for research institutes, pharmaceutical companies and clinics.

    - Maintain internal forks of open source projects like #ohif and Google's #neuroglancer and #nvidia's #monailabel server
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
      Oversee the technical direction and vision for the real-time location systems (#rtls) products.

      - Co-led an 8-person cross-functional Agile team, together with a Project Manager and a Product Owner
      - Ensured cohesion and quality over the lifecycle of the product and infused engineering best practices throughout the team
      - Worked in the #rtls standardization effort with the #omlox consortium, part of the #profibus
      - Spearheaded company wide initiatives to boost technical excellence and foster innovation across the engineering team

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

      - Transformed an initial prototype into a robust, production-grade platform, adaptable to any use case and capable of processing data from thousands of BLE and UWB devices
      - Successfully executed one of Europe's largest #rtls projects, encompassing over 1500 #uwb tags at high refresh rates
      - Introduced modern software development practices which improved technical quality and reduced manual testing from 4 days to 30 min

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
    Dissertation title: "EPCGlobal Architecture:
    Smart Shelf Implementation for Retail Inventory Management"
  ]

  #education(
    degree: "Exchange Student",
    institution: polito,
    period: "2018 - 2019",
  )[
    #icts: focus on automotive, IoT applications and machine learning.
  ]

  == Skills & Tools

  #tag(go)
  #tag(python)
  #tag(typescript)
  #tag(reactjs)
  #tag(nix)
  #tag(wasm)

  #line(length: 100%, stroke: (dash: "dashed", thickness: 0.6pt))

  #tag(k8s)
  #tag[#docker / #podman]
  #tag(helm)
  #tag(postgres)

  == Languages

  - Portuguese (Native)
  - English (C1)

  == Projects

  #github_card("wavecomtech", "omlox-client-go")
  #hrule
  #github_card("NixOS", "nixpkgs", desc: "Package maintainer")

  // == Organizations

  // === Vice President \
  // #hardwarecity \
  // #tag[Product Development]

  // === Logistics \
  // #eestec \
  // #tag[Workshops]

  // === Electric Powertrain \
  // #engenius\
  // #tag[CAN Bus]
  // #tag[BMS Systems]
]
