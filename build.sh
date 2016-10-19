#!/bin/bash

# This script requires Inkscape and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
inkscape='inkscape'
pdftk='pdftk'

# $PSScriptRoot is an automatic variable set to the current file's/module's directory
cd "`dirname "$0"`"
mkdir -p dist
$inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1A.pdf
$inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B.pdf
$inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg2A.pdf
$inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2B.pdf

$inkscape Pg1-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1A.png
$inkscape Pg1-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B.png
$inkscape Pg2-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2A.png
$inkscape Pg2-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2B.png

$pdftk dist/pg1A.pdf dist/pg1B.pdf dist/pg2A.pdf dist/pg2B.pdf cat output dist/DrCyanos_DnD-Character-Sheet.pdf
