#!/usr/bin/bash

# This script requires Inkscape and pdfunite
inkscape='inkscape'
pdfunite='pdfunite'
libre_office='soffice'

cd "`dirname "$0"`"
mkdir -p dist
rm dist/*.pdf
rm dist/*.png

echo "Converting SVG to PDF..."
$inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1A.pdf
$inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B.pdf
$inkscape Pg1-B_no-weight.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B_no-weight.pdf
$inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg2A.pdf
$inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2B.pdf
$inkscape Pg1-A_clean.svg --export-area-page --export-text-to-path --export-pdf dist/pg1A_clean.pdf
$inkscape Pg1-B_clean.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B_clean.pdf
$inkscape Pg1-B_no-weight_clean.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B_no-weight_clean.pdf
$inkscape Pg2-A_clean.svg --export-area-page --export-text-to-path --export-pdf dist/pg2A_clean.pdf
$inkscape Pg2-B_clean.svg --export-area-page --export-text-to-path --export-pdf dist/pg2B_clean.pdf
$inkscape Half-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Minimal.pdf
$inkscape One-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Condensed.pdf

echo "Combining pages..."
$pdfunite dist/pg1A.pdf dist/pg1B.pdf dist/pg2A.pdf dist/pg2B.pdf dist/DrCyanos_DnD-Character-Sheet_Full.pdf
$pdfunite dist/pg1A.pdf dist/pg1B_no-weight.pdf dist/pg2A.pdf dist/pg2B.pdf dist/DrCyanos_DnD-Character-Sheet_Full_Simple-Encumbrance.pdf
$pdfunite dist/pg1A_clean.pdf dist/pg1B_clean.pdf dist/pg2A_clean.pdf dist/pg2B_clean.pdf dist/DrCyanos_DnD-Character-Sheet_Full_Clean.pdf
$pdfunite dist/pg1A_clean.pdf dist/pg1B_no-weight_clean.pdf dist/pg2A_clean.pdf dist/pg2B_clean.pdf dist/DrCyanos_DnD-Character-Sheet_Full_Simple-Encumbrance_Clean.pdf
rm -vf dist/pg*.pdf

echo "Generating preview images..."
$inkscape Pg1-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1A.png
$inkscape Pg1-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B.png
$inkscape Pg1-B_no-weight.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B_no-weight.png
$inkscape Pg2-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2A.png
$inkscape Pg2-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2B.png
$inkscape Pg1-A_clean.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1A_clean.png
$inkscape Pg1-B_clean.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B_clean.png
$inkscape Pg1-B_no-weight_clean.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B_no-weight_clean.png
$inkscape Pg2-A_clean.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2A_clean.png
$inkscape Pg2-B_clean.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2B_clean.png
$inkscape Half-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_minimal.png
$inkscape One-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_condensed.png

echo "Exporting form-fillable character sheet..."
$libre_office --headless --convert-to pdf:draw_pdf_Export --outdir ./dist ./DrCyanos_DnD-Character-Sheet_Fillable.odt

echo "...done"
