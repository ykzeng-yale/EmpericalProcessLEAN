#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: scripts/compile_report_pdf.sh Reports/<report-folder>" >&2
  exit 64
fi

report_dir="${1%/}"

if [[ ! -d "$report_dir" ]]; then
  echo "report folder not found: $report_dir" >&2
  exit 66
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is required to compile theorem reports" >&2
  exit 69
fi

pdf_engine="xelatex"
if ! command -v xelatex >/dev/null 2>&1; then
  if command -v tectonic >/dev/null 2>&1; then
    pdf_engine="tectonic"
  else
    echo "xelatex or tectonic is required to compile theorem reports" >&2
    exit 69
  fi
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

combined="$tmpdir/report.md"

{
  printf '%s\n' '---'
  printf '%s\n' 'title: "VdVW Theorem Proof Report"'
  printf '%s\n' 'geometry: margin=1in'
  printf '%s\n' '---'
  for file in README.md crosswalk.md definition_lemma_crosscheck.md source_screenshots.md; do
    if [[ -f "$report_dir/$file" ]]; then
      printf '\n\n'
      sed -e 's/[[:space:]]*$//' "$report_dir/$file"
    fi
  done
} > "$combined"

pandoc "$combined" \
  --from markdown+raw_tex \
  --pdf-engine="$pdf_engine" \
  -V monofont=Menlo \
  --resource-path=".:$PWD:$report_dir:$PWD/$report_dir" \
  --output "$report_dir/report.pdf"

echo "compiled $report_dir/report.pdf"
