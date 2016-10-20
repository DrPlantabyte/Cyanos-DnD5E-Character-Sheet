# This script requires Inkscape and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
$inkscape = 'C:\Program Files\Inkscape\inkscape.exe'
$pdftk = 'pdftk.exe'

# $PSScriptRoot is an automatic variable set to the current file's/module's directory
cd $PSScriptRoot
mkdir -Force dist
# Note: the & invokation is needed to execute .exe files, but it does not wait 
# for completion unless the output is piped (slightly hackish work-around)
echo "Converting SVG to PDF..."
& $inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1A.pdf | Out-Null
& $inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg1B.pdf | Out-Null
& $inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg2A.pdf | Out-Null
& $inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2B.pdf | Out-Null
& $inkscape Half-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Minimal.pdf | Out-Null
& $inkscape One-Page.svg --export-area-page --export-text-to-path --export-pdf dist/DrCyanos_DnD-Character-Sheet_Condensed.pdf | Out-Null

echo "Combining pages..."
& $pdftk dist/pg1A.pdf dist/pg1B.pdf dist/pg2A.pdf dist/pg2B.pdf cat output dist/DrCyanos_DnD-Character-Sheet_Full.pdf
rm dist/pg*.pdf

echo "Generating preview images..."
& $inkscape Pg1-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1A.png | Out-Null
& $inkscape Pg1-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg1B.png | Out-Null
& $inkscape Pg2-A.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2A.png | Out-Null
& $inkscape Pg2-B.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_pg2B.png | Out-Null
& $inkscape Half-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_minimal.png | Out-Null
& $inkscape One-Page.svg --export-area-page --export-background "white" --export-dpi 40 --export-png dist/preview_condensed.png | Out-Null

echo "...done"
