# My CV

My curriculum vitae based on the [AltaCV](https://github.com/liantze/AltaCV) LaTex templace.

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
> There is an ongoing effort to make this template more easily available.
> See <https://github.com/dvcorreia/alta-cv-typst>.
