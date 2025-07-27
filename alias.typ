#import "template/lib.typ": https, github_href

#let sub(name, href: "") = {
  if href != "" {
    if href.contains("https://") {
      link(href, name)
    } else {
      link(https(href), name)
    }
  } else {
    name
  }
}

// programming Languages
#let go = sub("Go", href: "go.dev")
#let python = sub("Python", href: "python.org")
#let wasm = sub("WebAssembly", href: "webassembly.org")
#let nix = sub("Nix", href: "nixos.org")
#let typescript = sub("TypeScript", href: "typescriptlang.org")
#let reactjs = sub("ReactJS", href: "react.dev")
#let java = sub("Java")

// projects
#let ohif = sub("OHIF", href: "ohif.org")
#let neuroglancer = sub("Neuroglancer", href: github_href("google", repo: "neuroglancer"))
#let monai = sub("MONAI", href: "monai.io")
#let monailabel = sub("MONAILabel", href: github_href("Project-MONAI", repo: "MONAILabel"))
#let esckan = sub("ESCKAN", href: github_href("MetaCell", repo: "sckan-explorer", branch: "develop"))
#let celegans = sub("C-Elegans", href: github_href("MetaCell", repo: "c-elegans-app", branch: "develop"))

// tools
#let k8s = sub("Kubernetes", href: "kubernetes.io")
#let docker = sub("Docker", href: "docker.com")
#let podman = sub("Podman", href: "podman.io")
#let helm = sub("Helm", href: "helm.sh")
#let postgres = sub("PostgreSQL", href: "postgresql.org")

// companies
#let wavecom = sub("Wavecom Technologies", href: "wavecom.com")
#let metacell = sub("MetaCell", href: "metacell.us")
#let nvidia = sub("Nvidia", href: "nvidia.com")
#let siemens = sub("Siemens", href: "siemens.com")

// organizations
#let ua = sub("Universidade de Aveiro", href: "ua.pt")
#let polito = sub("Politecnico di Torino", href: "polito.it")
#let omlox = sub("Omlox", href: "omlox.com")
#let profibus = sub(
  "Profibus & Profinet International",
  href: "profibus.com/technology/omlox",
)
#let hardwarecity = sub("Hardware City", href: "hardwarecity.org")
#let eestec = sub("EESTEC LC Aveiro", href: "eestec.net/cities/aveiro")
#let engenius = sub("Engenius UA", href: "engeniusteam.web.ua.pt")
#let epcglobal = sub("EPCglobal", href: "gs1.org/epcglobal")
#let code-siemens = sub("Code & DevOps", href: "opensource.siemens.com/team")

// terms
#let rtls = sub(emph[RTLS])
#let uhf = sub(emph[UHF])
#let rfid = sub(emph[RFID])
#let ble = sub(emph[BLE])
#let uwb = sub(emph[UWB])
#let saas = sub[SaaS]

#let et = sub(
  "Electronics and Telecommunications Engineering",
  href: "ua.pt/en/curso/27",
)
#let icts = sub(
  "Information and Communication Technologies for Smart Societies",
  href: "www.polito.it/en/education/master-s-degree-programmes/ict-for-smart-societies",
)
