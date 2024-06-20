#!/usr/bin/env bash
saxonpath='/home/thanneken/java/saxon/saxon-he-12.3.jar'
echo "Using ${saxonpath}"
echo "Validating tei.xml"
xmlstarlet val -e -d tei_tc.dtd tei.xml
echo "Creating Latex derivative (text.latex)"
java -jar ${saxonpath} -s:tei.xml -xsl:tei2latex.xsl -o:text.latex -dtd:on
echo "Done deriving LaTeX from tei.xml"
xelatex text.latex
xelatex text.latex
xelatex text.latex
echo "Done deriving PDF from LaTeX"
rm -v text.1 text.1R text.2 text.2R text.3 text.3R text.4 text.5 text.6 text.aux text.log texput.log
