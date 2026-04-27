#!/bin/bash
# ============================================================
#  Sarathi AI Labs — Markdown to Branded PDF Builder
#  Usage:
#    ./build.sh input.md                    → outputs input.pdf
#    ./build.sh input.md output.pdf         → custom output name
#    ./build.sh f1.md f2.md f3.md -o out.pdf → combine multiple files
# ============================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CSS_FILE="${SCRIPT_DIR}/style.css"

# Ensure DYLD_LIBRARY_PATH includes homebrew libs (for WeasyPrint)
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:${DYLD_LIBRARY_PATH:-}"

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${RED}╔══════════════════════════════════════════╗${NC}"
    echo -e "${RED}║   Sarathi AI Labs — PDF Builder          ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

# --- Help ---
if [[ $# -eq 0 || "$1" == "--help" || "$1" == "-h" ]]; then
    print_header
    echo -e "${YELLOW}Usage:${NC}"
    echo "  ./build.sh <input.md>                    → generates input.pdf"
    echo "  ./build.sh <input.md> <output.pdf>       → custom output name"
    echo "  ./build.sh <f1.md> <f2.md> -o <out.pdf>  → combine multiple files"
    echo ""
    echo -e "${YELLOW}Options:${NC}"
    echo "  -o, --output <file>   Specify output PDF filename"
    echo "  --toc                 Include Table of Contents"
    echo "  -h, --help            Show this help message"
    echo ""
    exit 0
fi

# --- Parse arguments ---
INPUT_FILES=()
OUTPUT_FILE=""
INCLUDE_TOC=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        -o|--output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --toc)
            INCLUDE_TOC=true
            shift
            ;;
        *)
            INPUT_FILES+=("$1")
            shift
            ;;
    esac
done

# --- Validate input ---
if [[ ${#INPUT_FILES[@]} -eq 0 ]]; then
    echo -e "${RED}Error: No input markdown files specified.${NC}"
    exit 1
fi

for f in "${INPUT_FILES[@]}"; do
    if [[ ! -f "$f" ]]; then
        echo -e "${RED}Error: File not found: $f${NC}"
        exit 1
    fi
done

# --- Determine output filename and directory ---
TARGET_DIR="${SCRIPT_DIR}/../GeneratedPDF"
mkdir -p "$TARGET_DIR"

if [[ -z "$OUTPUT_FILE" ]]; then
    if [[ ${#INPUT_FILES[@]} -eq 1 ]]; then
        BASE_NAME=$(basename "${INPUT_FILES[0]}")
        OUTPUT_FILE="${TARGET_DIR}/${BASE_NAME%.md}.pdf"
    else
        OUTPUT_FILE="${TARGET_DIR}/combined_output.pdf"
    fi
else
    # Always place custom output files in GeneratedPDF
    BASE_NAME=$(basename "$OUTPUT_FILE")
    OUTPUT_FILE="${TARGET_DIR}/${BASE_NAME}"
fi

# --- Check dependencies ---
for cmd in pandoc weasyprint; do
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "${RED}Error: '$cmd' is not installed. Please install it first.${NC}"
        exit 1
    fi
done

# --- Build PDF ---
print_header

echo -e "${YELLOW}Input:${NC}  ${INPUT_FILES[*]}"
echo -e "${YELLOW}Output:${NC} ${OUTPUT_FILE}"
echo -e "${YELLOW}Style:${NC}  ${CSS_FILE}"
echo ""

PANDOC_ARGS=(
    "${INPUT_FILES[@]}"
    -o "$OUTPUT_FILE"
    --css="$CSS_FILE"
    --pdf-engine=weasyprint
    --standalone
    --metadata title="Sarathi AI Labs"
)

if $INCLUDE_TOC; then
    PANDOC_ARGS+=(--toc --toc-depth=3)
    echo -e "${GREEN}✓${NC} Table of Contents enabled"
fi

echo -e "${GREEN}⏳${NC} Generating PDF..."
pandoc "${PANDOC_ARGS[@]}"

# --- Done ---
FILE_SIZE=$(ls -lh "$OUTPUT_FILE" | awk '{print $5}')
echo ""
echo -e "${GREEN}✅ PDF generated successfully!${NC}"
echo -e "   File: ${YELLOW}${OUTPUT_FILE}${NC}"
echo -e "   Size: ${YELLOW}${FILE_SIZE}${NC}"
echo ""
