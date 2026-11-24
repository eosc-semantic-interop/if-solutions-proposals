#! /usr/bin/env bash
set -euo pipefail

num=${1:-??}
if [ "$num" == "??" ]; then
  mpat="??-*.md"
else
  mpat=$(printf '%02d-*.md' "$((10#$num))")
fi

# get the script's location folder and move into it
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

./mkln.sh "$num"

tmp_header=$(mktemp /tmp/rt-pdf-header-XXXXXX.tex)
tmp_md=""
trap 'rm -f "$tmp_header" "$tmp_md"' EXIT

cat <<'TEXEOF' > "$tmp_header"
\usepackage{etoolbox}
\usepackage{xurl}
\usepackage{fvextra}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,breakanywhere,commandchars=\\\{\},fontsize=\small}
\RecustomVerbatimEnvironment{verbatim}{Verbatim}{breaklines,breakanywhere,fontsize=\small}
\setlength{\emergencystretch}{3em}
\AtBeginEnvironment{longtable}{%
  \footnotesize
  \renewcommand{\arraystretch}{1.28}%
}
TEXEOF

COMMON_PANDOC_OPTS=(
  -f markdown+lists_without_preceding_blankline
  --pdf-engine=xelatex
  --resource-path=.
  --lua-filter=./table-widths.lua
  -H "$tmp_header"
  -V papersize=a4
  -V geometry:margin=2cm
  -V colorlinks=true
  -V linkcolor=blue
  -V urlcolor=blue
  -V toccolor=blue
)

# run over the markdown files in the folder and generate a PDF for each one
mds=$(find . -maxdepth 1 -name "$mpat" | sort)
for md in $mds; do
    pdf="${md%.md}.pdf"
    echo "Generating PDF for $md -> $pdf"
    pandoc "$md" -o "$pdf" "${COMMON_PANDOC_OPTS[@]}"
done

# when building all patterns, also generate a single consolidated PDF bundle
if [ "$num" == "??" ]; then
    bundle_pdf="RT-linkset-usage-patterns-complete.pdf"
    echo "Generating combined PDF bundle -> $bundle_pdf"
    tmp_md=$(mktemp /tmp/rt-patterns-bundle-XXXXXX.md)

    python3 - "$tmp_md" <<'PYEOF'
import re
import subprocess
import sys
from pathlib import Path

out_path = Path(sys.argv[1])
mds = sorted(Path(".").glob("??-*.md"))

anchor_map = {}
for p in mds:
    h1 = next((line for line in p.read_text(encoding="utf-8").splitlines() if line.startswith("# ")), "")
    if h1:
        html = subprocess.check_output(
            ["pandoc", "-f", "markdown", "-t", "html"],
            input=h1.encode("utf-8"),
        ).decode("utf-8")
        m = re.search(r'id="([^"]+)"', html)
        if m:
            anchor = f"#{m.group(1)}"
            pdf_name = p.with_suffix(".pdf").name
            for key in (p.name, f"./{p.name}", pdf_name, f"./{pdf_name}"):
                anchor_map[key] = anchor

parts = []
for idx, p in enumerate(mds):
    text = p.read_text(encoding="utf-8")
    for src, target in anchor_map.items():
        text = text.replace(f"({src})", f"({target})")
        text = re.sub(rf"(:\s+){re.escape(src)}(\s+)", rf"\1{target}\2", text)
    if idx > 0:
        parts.append("\n\n\\newpage\n\n")
    parts.append(text.rstrip() + "\n")

out_path.write_text("".join(parts), encoding="utf-8")
PYEOF

    pandoc "$tmp_md" \
      -o "$bundle_pdf" \
      "${COMMON_PANDOC_OPTS[@]}" \
      --toc --toc-depth=2 \
      -M title="Radical Transparency: Linkset Usage Patterns (RT-P01 to RT-P10)" \
      -M subtitle="Master Overview & Pattern Specifications"
fi
