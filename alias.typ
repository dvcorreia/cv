#import "template/lib.typ": https  

#let sub(name, href: "") = {
  if href != "" {
    link(https(href), name)
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

// tools
#let k8s = sub("Kubernetes", href: "kubernetes.io")
#let docker = sub("Docker", href: "docker.com")
#let podman = sub("Podman", href: "podman.io")
#let helm = sub("Helm", href: "helm.sh")
#let posgres = sub("PostgreSQL", href: "postgresql.org")

// companies
#let wavecom = sub("Wavecom Technologies", href: "wavecom.com")
#let metacell = sub("MetaCell", href: "metacell.us")

// organizations
#let ua = sub("Universidade de Aveiro", href: "ua.pt")
#let polito = sub("Politecnico di Torino", href: "polito.it")
#let omlox = sub("Omlox", href: "omlox.com")
#let profibus = sub("Profibus & Profinet International", href: "profibus.com/technology/omlox")
#let hardwarecity = sub("Hardware City", href: "hardwarecity.org")
#let eestec = sub("EESTEC LC Aveiro", href: "eestec.net/cities/aveiro")
#let engenius = sub("Engenius UA", href: "engeniusteam.web.ua.pt")

// terms
#let rtls = sub(emph[RTLS])
#let rfid = sub(emph[RFID])
#let ble = sub(emph[BLE])
#let uwb = sub(emph[UWB])

#let et = sub("Electronics and Telecommunications Engineering", href: "ua.pt/en/curso/27")
#let icts = sub("Information and Communication Technologies for Smart Societies", href: "www.polito.it/en/education/master-s-degree-programmes/ict-for-smart-societies")