#!/usr/bin/bash

# This script requires Inkscape and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
inkscape='inkscape'
pdftk='pdftk'

cd "`dirname "$0"`"
mkdir -p dist

echo "Converting SVG to PDF..."
$inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1A.pdf
$inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B.pdf
$inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg2A.pdf
$inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2B.pdf
$inkscape Half-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Minimal.pdf
$inkscape One-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Condensed.pdf

echo "Combining pages..."
$pdftk dist/pg1A.pdf dist/pg1B.pdf dist/pg2A.pdf dist/pg2B.pdf cat output dist/DrCyanos_DnD-Character-Sheet_Full.pdf
rm -vf dist/pg*.pdf

echo "Generating preview images..."
$inkscape Pg1-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1A.png
$inkscape Pg1-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B.png
$inkscape Pg2-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2A.png
$inkscape Pg2-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2B.png
$inkscape Half-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_minimal.png
$inkscape One-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_condensed.png

echo "...done"
