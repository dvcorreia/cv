#import "cv.typ": cv, term, experience, education, tag, hrule, space, text_10
#show: cv.with(
  name: "Diogo Vala Correia",
  photo: "me3.jpg",
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
    company: link("https://www.metacell.us/")[MetaCell],
    period: "Jun 2024 -- Ongoing",
    location: "Remote to Cambridge, US",
  )[
    Drive neuroscience further.

    - Developing solutions to serve high bandwidth medical images to web browser applications
    - Integrating AI solutions into our hosting products
    - Colaborating on an authorization solution for client access to medical data 
  ]

  #hrule

  #experience(
    title: "Product Technical Lead",
    company: link("https://www.wavecom.com/")[Wavecom Technologies],
    period: "Dec 2022 -- Jun 2024",
    location: "Aveiro, Portugal",
  )[
    Oversee the technical direction and vision for the real-time location systems (#emph[RTLS]) products.

    - Served as lead developer, providing technical solutions and contributing to the product across all stages of it's lifecycle
    - Ensure cohesion and quality over the lifecycle of the product and infuse engineering best practices throughout the team
    - Working in the #emph[RTLS] standardization effort with the #link("https://omlox.com/")[Omlox™] consortium, part of the #link("https://www.profibus.com/technology/omlox")[Profibus & Profinet International]
    - Spearheaded a developer advocacy initiative to boost the company's technical excellence, foster innovation, and mentor recent college graduates
  ]

  #v(space.med)

  #experience(
    title: "Software Engineer",
    company: link("https://www.wavecom.com/")[Wavecom Technologies],
    period: "Apr 2021 -- Dec 2022",
    location: "Aveiro, Portugal",
  )[
    Worked on real-time location systems (#emph[RTLS]) and radio identification (#emph[RFID]) products for industry and healthcare.

    - Developed software in python and go to connect, manage and process packets for thousands of BLE and UWB devices
    - Worked on UHF RFID software solutions in python and java to improve client logistics and shop floor operations
    - Successfully executed the deployment of one of Europe's largest real-time locating system (#emph[RTLS]) projects for Continental AG's manufacturing group, encompassing over 1500 UWB tags
    - Introduced modern software development life cycle tools and developed a set codebases that resulted in improved technical quality, reduced bugs and development agility
  ]
][
  == Education

  #education(
    degree: [B.Sc. and M.Sc. in #link("https://www.ua.pt/en/curso/27")[Electronics and Telecommunications Engineering]],
    institution: link("https://www.ua.pt")[Universidade de Aveiro],
    period: "2014 - 2020"
  )[
    Dissertation title: "EPCGlobal Architecture:
    Smart Shelf Implementation for Retail Inventory Management"
  ]

  #education(
    degree: "Exchange Student",
    institution: link("https://www.polito.it/")[Politecnico di Torino],
    period: "2018 - 2019"
  )[
    #link("https://www.polito.it/en/education/master-s-degree-programmes/ict-for-smart-societies")[Information and Communication Technologies for Smart Societies]: focus on automotive, IoT applications and machine learning.
  ]

  == Skills & Tools

  #tag[#link("https://go.dev/")[Go]]
  #tag[#link("https://www.python.org/")[Python]]
  #tag[#link("https://webassembly.org")[WebAssembly]]
  #tag[#link("https://nixos.org")[Nix]]
  #tag[Typescript]
  #tag[React JS]

  #line(length: 100%, stroke: (dash: "dashed", thickness: 0.6pt))

  #tag[Kubernetes]
  #tag[Podman / Docker]
  #tag[Helm]
  #tag[PostgreSQL]

  == Languages

  - Portuguese (Native)
  - English (C1)

  == Organizations

  === Vice President \
  #link("http://hardwarecity.org/")[Hardware City] \
  #tag[Product Development]

  === Logistics \
  #link("https://eestec.net/cities/aveiro")[EESTEC LC Aveiro] \
  #tag[Workshops]

  === Electric Powertrain \
  #link("https://engeniusteam.web.ua.pt")[Engenius UA] \
  #tag[CAN Bus]
  #tag[BMS Systems]
]
