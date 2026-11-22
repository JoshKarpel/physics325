#!/usr/bin/env bash
# Compile every lab manual to a PDF and write an index page linking them,
# producing a static site in the given directory (default: site).

set -euo pipefail

cd "$(dirname "$0")"

out="${1:-site}"
mkdir -p "$out"

items=""
for tex in manuals/*.tex; do
  name="$(basename "$tex" .tex)"
  title="$(sed -n 's/^\\title{\(.*\)}$/\1/p' "$tex")"
  echo "compiling $name..."
  tectonic --outdir "$out" "$tex"
  items+="      <li><a href=\"$name.pdf\">$title</a></li>"$'\n'
done

cat > "$out/index.html" <<EOF
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Physics 325 Lab Manuals</title>
    <style>
      body { font-family: Georgia, serif; max-width: 40rem; margin: 3rem auto; padding: 0 1rem; line-height: 1.5; }
      li { margin: 0.25rem 0; }
    </style>
  </head>
  <body>
    <h1>Physics 325 Lab Manuals</h1>
    <ul>
$items    </ul>
  </body>
</html>
EOF

echo "wrote $out/index.html"
