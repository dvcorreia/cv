"""CV Builder POC server.

Serves a form, accepts JSON, shells out to `typst compile` (the Nix-wrapped
binary with fonts + font-awesome baked in), and returns the rendered PDF.

Config via env:
  TYPST_BIN   path to the typst binary (default: "typst" on PATH)
  CV_ROOT     repo root passed to `typst --root` (default: parent of this file)
"""

from __future__ import annotations

import json
import os
import subprocess
from pathlib import Path

from fastapi import FastAPI, Request, Response
from fastapi.responses import FileResponse, PlainTextResponse

HERE = Path(__file__).resolve().parent
CV_ROOT = Path(os.environ.get("CV_ROOT", HERE.parent)).resolve()
TYPST_BIN = os.environ.get("TYPST_BIN", "typst")
RENDER_TYP = "poc/render.typ"  # root-relative
FORM_HTML = HERE / "form.html"

app = FastAPI(title="CV Builder POC")


@app.get("/")
def index() -> FileResponse:
    return FileResponse(FORM_HTML, media_type="text/html")


@app.post("/render")
async def render(request: Request) -> Response:
    data = await request.json()
    payload = json.dumps(data)

    proc = subprocess.run(
        [
            TYPST_BIN,
            "compile",
            "--root",
            str(CV_ROOT),
            "--input",
            f"json={payload}",
            RENDER_TYP,
            "-",  # write PDF to stdout
        ],
        cwd=CV_ROOT,
        capture_output=True,
    )

    if proc.returncode != 0:
        return PlainTextResponse(
            proc.stderr.decode("utf-8", "replace") or "typst failed",
            status_code=500,
        )

    return Response(
        content=proc.stdout,
        media_type="application/pdf",
        headers={"Content-Disposition": 'inline; filename="cv.pdf"'},
    )


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8000)
