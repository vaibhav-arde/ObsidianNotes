# Markdown → Professional PDF Setup Guide

> **System**: Pandoc + WeasyPrint + Custom CSS  
> **Platform**: macOS (Apple Silicon / ARM64)  
> **Brand**: Sarathi AI Labs  
> **Date**: April 2026

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Step-by-Step Setup](#step-by-step-setup)
  - [1. Install Pandoc](#1-install-pandoc)
  - [2. Install WeasyPrint](#2-install-weasyprint)
  - [3. Install System Dependencies](#3-install-system-dependencies-pango--gobject)
  - [4. Fix Library Path for macOS](#4-fix-library-path-for-macos)
  - [5. Verify Installation](#5-verify-installation)
- [Project Structure](#project-structure)
- [Usage Guide](#usage-guide)
  - [Quick Start (One Command)](#quick-start-one-command)
  - [Direct Pandoc Commands](#direct-pandoc-commands)
  - [Build Script Usage](#build-script-usage)
- [Customization](#customization)
  - [Changing Brand Colors](#changing-brand-colors)
  - [Adding Your Logo](#adding-your-logo)
  - [Modifying Headers/Footers](#modifying-headersfooters)
- [All Commands Used in Setup](#all-commands-used-in-setup)
- [Troubleshooting](#troubleshooting)
- [Reference Links](#reference-links)

---

## Overview

This system converts `.md` (Markdown) files into professionally styled PDFs with:

- ✅ **Custom branding** — Sarathi AI Labs logo, cyan/blue futuristic theme
- ✅ **Headers & Footers** — company name, page numbers, website
- ✅ **Syntax-highlighted code blocks** — dark navy theme with cyan accent
- ✅ **Table of Contents** — auto-generated from headings
- ✅ **Cover page** — with title, subtitle, and metadata
- ✅ **Professional tables** — styled with brand colors
- ✅ **One-command build** — `./build.sh training.md` → `training.pdf`

---

## Architecture

```
┌─────────────┐     ┌──────────┐     ┌──────────────┐     ┌──────────┐
│  .md file   │ ──→ │  Pandoc  │ ──→ │  WeasyPrint  │ ──→ │  .pdf    │
│ (Markdown)  │     │ (convert)│     │ (CSS → PDF)  │     │ (output) │
└─────────────┘     └──────────┘     └──────────────┘     └──────────┘
                         ↑
                    ┌──────────┐
                    │ style.css│
                    │ (brand)  │
                    └──────────┘
```

**Why this stack?**

| Tool        | Purpose                                     |
|-------------|---------------------------------------------|
| **Pandoc**  | Converts Markdown → HTML (intermediate)     |
| **WeasyPrint** | Renders HTML+CSS → PDF (the PDF engine)  |
| **style.css**  | Your brand styling (colors, fonts, layout)|
| **build.sh**   | Wrapper script for one-command builds     |

---

## Step-by-Step Setup

### 1. Install Pandoc

Pandoc is the universal document converter.

```bash
brew install pandoc
```

**Verify:**

```bash
pandoc --version
```

Expected output: `pandoc 3.x` or higher.

---

### 2. Install WeasyPrint

WeasyPrint is the CSS-based PDF rendering engine (replaces LaTeX).

```bash
pip3 install weasyprint
```

---

### 3. Install System Dependencies (Pango + GObject)

WeasyPrint requires native libraries for text rendering:

```bash
brew install pango
```

> **Note:** `pango` automatically pulls in `glib` (which includes `gobject`), `harfbuzz`, `fontconfig`, and other required native dependencies.

---

### 4. Fix Library Path for macOS

On macOS, Python (installed via python.org installer) can't find Homebrew libraries by default. You need to set `DYLD_LIBRARY_PATH`:

```bash
# Add to your ~/.zshrc (permanent fix)
echo '' >> ~/.zshrc
echo '# WeasyPrint - Homebrew library path for PDF generation' >> ~/.zshrc
echo 'export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"' >> ~/.zshrc
```

**Apply immediately (current session):**

```bash
source ~/.zshrc
```

> **Why?** WeasyPrint uses `cffi` to load `libgobject-2.0`, `libpango-1.0`, etc. These live in `/opt/homebrew/lib/` but the system Python doesn't search there by default.

---

### 5. Verify Installation

```bash
# Check Pandoc
pandoc --version

# Check WeasyPrint
weasyprint --version
```

Expected:

```
pandoc 3.3
WeasyPrint version 68.1
```

**Quick test — generate a PDF:**

```bash
echo "# Hello World" | pandoc -o test.pdf --pdf-engine=weasyprint
```

If `test.pdf` is created, your setup is complete. ✅

---

## Project Structure

```
md-to-pdf/
├── build.sh              # One-command build script
├── style.css             # Branded CSS stylesheet
├── logo.png              # Sarathi AI Labs logo
├── sample-training.md    # Example markdown document
├── sample-training.pdf   # Generated output (example)
└── SETUP_GUIDE.md        # This file
```

| File                  | Purpose                                            |
|----------------------|-----------------------------------------------------|
| `build.sh`           | Shell script — wraps pandoc+weasyprint with defaults |
| `style.css`          | Sarathi AI Labs branded CSS (cyan/blue futuristic)   |
| `logo.png`           | Company logo (circuit horse design)                  |
| `sample-training.md` | Example Playwright training document                 |
| `SETUP_GUIDE.md`     | Complete setup instructions (this file)              |

---

## Usage Guide

### Quick Start (One Command)

```bash
cd md-to-pdf/

# Single file
./build.sh my-document.md

# Custom output name
./build.sh my-document.md -o final-report.pdf

# With Table of Contents
./build.sh my-document.md --toc

# Multiple files combined
./build.sh intro.md day1.md day2.md -o full-course.pdf

# Multiple files + TOC
./build.sh intro.md day1.md day2.md -o full-course.pdf --toc
```

### Direct Pandoc Commands

If you prefer running pandoc directly (without the build script):

```bash
# Basic branded PDF
pandoc file.md -o output.pdf --css=style.css --pdf-engine=weasyprint --standalone

# With Table of Contents
pandoc file.md -o output.pdf --css=style.css --pdf-engine=weasyprint --standalone --toc --toc-depth=3

# Multiple files into one PDF
pandoc intro.md day1.md day2.md -o course.pdf --css=style.css --pdf-engine=weasyprint --standalone

# With custom metadata
pandoc file.md -o output.pdf --css=style.css --pdf-engine=weasyprint --standalone \
  --metadata title="My Training Guide" \
  --metadata author="Sarathi AI Labs"
```

### Build Script Usage

```bash
./build.sh --help
```

```
╔══════════════════════════════════════════╗
║   Sarathi AI Labs — PDF Builder          ║
╚══════════════════════════════════════════╝

Usage:
  ./build.sh <input.md>                    → generates input.pdf
  ./build.sh <input.md> <output.pdf>       → custom output name
  ./build.sh <f1.md> <f2.md> -o <out.pdf>  → combine multiple files

Options:
  -o, --output <file>   Specify output PDF filename
  --toc                 Include Table of Contents
  -h, --help            Show this help message
```

---

## Customization

### Changing Brand Colors

The current brand palette uses **#07B0D8** (Sarathi Cyan). Edit `style.css` to adjust:

```css
/* Current: Sarathi Cyan */
color: #07B0D8;

/* Brand token reference: */
/* --brand-primary:  #07B0D8  (cyan)           */
/* --brand-dark:     #048BA8  (dark cyan)      */
/* --brand-deeper:   #036B82  (deeper cyan)    */
/* --brand-light:    #E0F7FA  (light cyan bg)  */
/* --brand-glow:     #0CD5FF  (glow accent)    */
```

**Key locations in `style.css` to update:**

| Element          | CSS Selector              | Current Color |
|-----------------|---------------------------|---------------|
| H1 headings     | `h1 { color: ... }`       | `#07B0D8`     |
| H1 border       | `h1 { border-bottom: ... }`| `#07B0D8`    |
| Links           | `a { color: ... }`        | `#07B0D8`     |
| Blockquote      | `blockquote { border-left }`| `#07B0D8`   |
| Code block accent| `pre { border-left: ... }`| `#07B0D8`    |
| Table header    | `thead { background: ... }`| `#07B0D8`    |
| Header text     | `@top-left { color: ... }`| `#07B0D8`     |
| Cover page H1   | `.cover-page h1 { color }`| `#07B0D8`    |

### Adding Your Logo

1. Place your logo file (e.g. `logo.png`) in the `md-to-pdf/` directory
2. Reference it at the top of your Markdown file:

```markdown
![Logo](logo.png)

# Document Title
...
```

Or use the cover page format:

```markdown
<div class="cover-page">

![Logo](logo.png){.logo}

# Document Title

<p class="subtitle">Subtitle goes here</p>
<p class="meta">Author: Your Name | Date: April 2026</p>

</div>
```

### Modifying Headers/Footers

Edit the `@page` rules in `style.css`:

```css
@page {
  @top-left {
    content: "Your Company Name";  /* Change header text */
  }
  @top-right {
    content: "CONFIDENTIAL";       /* Or "DRAFT", "INTERNAL", etc. */
  }
  @bottom-left {
    content: "www.yoursite.com";   /* Change footer URL */
  }
  @bottom-center {
    content: "Page " counter(page) " of " counter(pages);
  }
  @bottom-right {
    content: "© Your Company";     /* Change copyright */
  }
}
```

---

## All Commands Used in Setup

Below is the complete list of every command used during the setup, in order:

```bash
# ============================================================
# STEP 1: Install Pandoc (document converter)
# ============================================================
brew install pandoc

# Verify
pandoc --version

# ============================================================
# STEP 2: Install WeasyPrint (CSS-based PDF engine)
# ============================================================
pip3 install weasyprint

# ============================================================
# STEP 3: Install Pango (native text rendering library)
# ============================================================
brew install pango

# ============================================================
# STEP 4: Fix macOS library path (permanent)
# ============================================================
echo '' >> ~/.zshrc
echo '# WeasyPrint - Homebrew library path for PDF generation' >> ~/.zshrc
echo 'export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"' >> ~/.zshrc

# Apply to current session
source ~/.zshrc

# ============================================================
# STEP 5: Verify everything works
# ============================================================
pandoc --version
weasyprint --version

# ============================================================
# STEP 6: Create project directory
# ============================================================
mkdir -p md-to-pdf

# ============================================================
# STEP 7: Make build script executable
# ============================================================
chmod +x md-to-pdf/build.sh

# ============================================================
# STEP 8: Test — Generate a branded PDF
# ============================================================
cd md-to-pdf/
./build.sh sample-training.md

# ============================================================
# STEP 9: Test — Generate with Table of Contents
# ============================================================
./build.sh sample-training.md -o output-with-toc.pdf --toc

# ============================================================
# STEP 10: Test — Combine multiple markdown files
# ============================================================
./build.sh file1.md file2.md file3.md -o combined.pdf
```

---

## Troubleshooting

### `weasyprint: command not found`

```bash
pip3 install weasyprint
```

### `OSError: cannot load library 'libgobject-2.0-0'`

Native libraries not found. Fix:

```bash
brew install pango
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"
```

Add the export to `~/.zshrc` to make it permanent.

### `pdflatex not found`

You're running pandoc without specifying the PDF engine. Always include:

```bash
pandoc file.md -o file.pdf --pdf-engine=weasyprint
```

Or use the `build.sh` script which handles this automatically.

### Warnings about `overflow-x` or `user-select`

These are harmless — WeasyPrint ignores CSS properties that only apply to screen rendering. The PDF output is unaffected.

### Fonts look different than expected

WeasyPrint uses system fonts. If `Inter` or `Fira Code` aren't installed locally, it falls back to `Arial` / `Courier New`. To install the fonts:

```bash
# Download Inter and Fira Code from Google Fonts
# Place .ttf files in ~/Library/Fonts/
```

---

## Reference Links

| Resource                 | URL                                             |
|-------------------------|--------------------------------------------------|
| Pandoc Documentation    | https://pandoc.org/MANUAL.html                   |
| WeasyPrint Docs         | https://doc.courtbouillon.org/weasyprint/stable/ |
| WeasyPrint CSS Support  | https://doc.courtbouillon.org/weasyprint/stable/api_reference.html |
| Pango (text rendering)  | https://pango.gnome.org/                         |
| Google Fonts — Inter    | https://fonts.google.com/specimen/Inter           |
| Google Fonts — Fira Code| https://fonts.google.com/specimen/Fira+Code       |

---

*Guide created: April 24, 2026 — Sarathi AI Labs*
