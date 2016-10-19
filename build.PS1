# This script requires Inkscape and PDFtk (https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
$inkscape = 'C:\Program Files\Inkscape\inkscape.exe'
$pdftk = 'pdftk.exe'

# $PSScriptRoot is an automatic variable set to the current file's/module's directory
cd $PSScriptRoot
mkdir -Force dist
# Note: the & invokation is needed to execute .exe files, but it does not wait 
# for completion unless the output is piped (slightly hackish work-around)
& $inkscape Pg1-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg1.pdf | Out-Null
& $inkscape Pg1-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg2.pdf | Out-Null
& $inkscape Pg2-A.svg --export-area-page --export-text-to-path --export-pdf dist/pg3.pdf | Out-Null
& $inkscape Pg2-B.svg --export-area-page --export-text-to-path --export-pdf dist/pg4.pdf | Out-Null

& $pdftk dist/pg1.pdf dist/pg2.pdf dist/pg3.pdf dist/pg4.pdf cat output dist/DrCyanos_DnD-Character-Sheet.pdf
