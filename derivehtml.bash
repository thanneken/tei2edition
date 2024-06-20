#!/usr/bin/env bash
saxonpath='/home/thanneken/git/teic/Stylesheets/lib/saxon9he.jar'
saxonpath='/home/thanneken/java/saxon/saxon-he-12.3.jar'
echo "Using ${saxonpath}"
if [[ tei_tc.odd -nt tei_tc.dtd ]]; then
	echo "Updating DTD based on updated ODD"
	/home/thanneken/git/teic/Stylesheets/bin/teitodtd tei_tc.odd tei_tc.dtd
else
	echo "DTD is up to date"
fi

echo "Validating LatinMoses.xml"
xmlstarlet val -e -d tei_tc.dtd tei.xml
echo "Creating Text HTML derivative (text.html)"
java -jar ${saxonpath} -s:tei.xml -xsl:tei2html.xsl -o:text.html -dtd:on
echo "Asking tidy to check and format"
# tidy -qe text.html
tidy -qemi -w 200 text.html
echo "Done deriving HTML from tei.xml"

