#!/bin/bash

# This script requires Inkscape and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
inkscape='inkscape'
pdftk='pdftk'

# $PSScriptRoot is an automatic variable set to the current file's/module's directory
cd "`dirname "$0"`"
mkdir -p dist
$inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1.pdf
$inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2.pdf
$inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg3.pdf
$inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg4.pdf

$pdftk dist/pg1.pdf dist/pg2.pdf dist/pg3.pdf dist/pg4.pdf cat output dist/DrCyanos_DnD-Character-Sheet.pdf
