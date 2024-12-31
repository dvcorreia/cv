#import "template/cv.typ": cv, experience, chronology, education, tag, hrule
#import "template/lib.typ": space, text_10
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
    period: "Jun 2024 -- Ongoing",
    location: "Remote to Cambridge, US",
  )[
    Drive neuroscience further.

    - Developing solutions to serve high bandwidth medical images to web browser applications
    - Integrating AI solutions into our hosting products
    - Colaborating on an authorization solution for client access to medical data
  ]

  #hrule

  #chronology(
    wavecom,
  )[
    #experience(
      title: "Product Technical Lead",
      period: "Dec 2022 -- Jun 2024",
      location: "Aveiro, Portugal",
    )[
      Oversee the technical direction and vision for the real-time location systems (#rtls) products.

      - Served as lead developer, providing technical solutions and contributing to the product across all stages of it's lifecycle
      - Ensure cohesion and quality over the lifecycle of the product and infuse engineering best practices throughout the team
      - Working in the #rtls standardization effort with the #omlox consortium, part of the #profibus
      - Spearheaded a developer advocacy initiative to boost the company's technical excellence, foster innovation, and mentor recent college graduates
    ]
  ][
    #experience(
      title: "Software Engineer",
      company: wavecom,
      period: "Apr 2021 -- Dec 2022",
      location: "Aveiro, Portugal",
    )[
      Worked on real-time location systems (#rtls) and radio identification (#rfid) products for industry and healthcare.

      - Developed software in #python and #go to connect, manage and process packets for thousands of #ble and #uwb devices
      - Worked on UHF #rfid software solutions in #python and #java to improve client logistics and shop floor operations
      - Successfully executed the deployment of one of Europe's largest real-time locating system (#rtls) projects for Continental AG's manufacturing group, encompassing over 1500 #uwb tags
      - Introduced modern software development life cycle tools and developed a set codebases that resulted in improved technical quality, reduced bugs and development agility
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
  #tag(wasm)
  #tag(nix)
  #tag(typescript)
  #tag(reactjs)

  #line(length: 100%, stroke: (dash: "dashed", thickness: 0.6pt))

  #tag(k8s)
  #tag[#docker / #podman]
  #tag(helm)
  #tag(posgres)

  == Languages

  - Portuguese (Native)
  - English (C1)

  == Organizations

  === Vice President \
  #hardwarecity \
  #tag[Product Development]

  === Logistics \
  #eestec \
  #tag[Workshops]

  === Electric Powertrain \
  #engenius\
  #tag[CAN Bus]
  #tag[BMS Systems]
]