# My (Alta)CV

A port of [AltaCV](https://github.com/liantze/AltaCV) to Typst for personal use because LaTex is hard to maintain.

## Getting Started

To use this template you don’t need much: `Ctrl+F`, a pair of eyes, a working brain, and maybe an AI buddy for customizations.

### _Installing Nix_

This project is powered by Nix.
It’s amazing and it makes both our lifes easier, you should learn it!
These instructions _SHOULD_ work on most systems. For guaranteed happiness, check the official docs linked above.**

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Then reload your shell.

#### MacOS specific caveats

After a MacOS upgrade, Nix might decide to die on you.  
If that happens, [follow these instructions](https://github.com/NixOS/nix/issues/3616#issuecomment-662858874).  

### Developing

First, generate the GitHub repo metadata files.  
These power the `#github_card` component:

```console
> nix run .#gen
```

Then, run the watcher to recompile your CV on the fly:

```console
> nix run
```

Got stuck on something? Open an issue. I’ll get back to you faster than you expect.

### Publishing

Want a shiny PDF? Run:

```console
> nix run .#build
```

For more advanced setups (CI/CD, auto-publishing, the whole shenanigans), check the GitHub Workflows in this repo.

## Disclaimer

> [!WARNING]  
> This is **not** the most idiomatic Typst code.  
> I don’t plan on becoming a Typst wizard anytime soon.  
> I already have Nix and that’s enough wizardry for one lifetime.

This project was inspired by:

* <https://github.com/liantze/AltaCV>
* <https://github.com/GeorgeHoneywood/alta-typst>
* <https://github.com/AsiSkarp/grotesk-cv>
