#!/usr/bin/env sh
# Read-only inventory of a skill folder. Prints file list, sizes, and literal hosts found in text files.
# Usage: sh scripts/inventory.sh path/to/skill
set -eu
dir="${1:?usage: inventory.sh <dir>}"
echo "== files =="
find "$dir" -type f ! -path '*/.git/*' -exec ls -l {} \; | awk '{print $5, $9}'
echo
echo "== hosts referenced in text files =="
grep -rhoE 'https?://[A-Za-z0-9.-]+' "$dir" --exclude-dir=.git 2>/dev/null | sed -E 's#https?://##' | sort | uniq -c | sort -rn || true
echo
echo "== suspicious tokens =="
grep -rnE 'eval|base64|curl[^|]*\|[[:space:]]*(sh|bash)|sudo|chmod|~/\.ssh|~/\.aws|\.env\b|process\.env|os\.environ' "$dir" --exclude-dir=.git 2>/dev/null || echo "none"
