# CV Web-Render POC — Notes

Proof of concept for: browser form → server → `typst compile` → PDF, reusing the
existing Nix-packaged Typst environment (fonts + font-awesome baked in). The server
calls `typst compile` per request — **not** `nix build` per request.

## Files

- `render.typ` — data-driven CV. Reuses `../template/cv.typ` components; only content is data-driven.
- `cv-data.json` — sample data shape.
- `form.html` — minimal browser form (add-experience, submit → opens PDF).
- `server.py` — FastAPI: `GET /` serves the form, `POST /render` maps JSON → typst → streams PDF.
- `flake.nix` apps: `nix run .#poc-render` (CLI) and `nix run .#poc-server`.

## Run

```
nix run .#poc-server            # open http://127.0.0.1:8000
nix run .#poc-render -- out.pdf # CLI variant
```

## Verdict

Works, and it's fast: **~190ms** round-trip including compile (vs. seconds for a
per-request `nix build`). Errors from typst surface as HTTP 500 with the message.

## Key learnings / gotchas

1. **`--root` is mandatory.** Typst sandboxes file access to the compiled file's
   directory. The server must pass `--root <repo>` and use root-relative import paths
   (`/template/...`, not `../template/...`) and root-relative data paths (`/poc/...`).

2. **Inline JSON beats temp files.** Pass data via `--input json=<string>` and read it
   in Typst with `json(bytes(sys.inputs.json))`. This avoids writing temp files inside
   the repo root (no concurrency/cleanup issues). `render.typ` also supports
   `--input data=<root-relative path>` for CLI use.
   - Caveat: very large payloads can hit `ARG_MAX`. A production version should pipe via
     stdin or a temp file in a dedicated working dir.

3. **Dates need parsing.** Components expect `datetime` objects; JSON gives strings.
   `render.typ` parses `YYYY-MM-DD` and treats `present`/empty as `datetime.today()`.
   This is the main data-mapping friction point.

4. **PDF to stdout.** `typst compile ... -` writes the PDF to stdout; the server captures
   it directly (no temp output file).

5. **`writeShellApplication` runs shellcheck** and fails the build on warnings. Declare
   and assign separately (`VAR=...; export VAR`) to avoid SC2155.

6. **`typst-wrapped` is not a top-level flake output.** It's a passthru attr on the
   package: `packages.<system>.default.typst-wrapped`. The `poc-server` app puts it on
   PATH via `runtimeInputs`.

## Deliberately excluded (out of POC scope)

- `github_card` (needs pre-fetched per-repo JSON in `template/gh-metadata/`)
- Photo upload (validation/resize)
- Auth, rate limiting, input/resource sandboxing
- Form styling, concurrency limits, containerized deployment

The template renders fine without github cards and photos.
