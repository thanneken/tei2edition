#!/usr/bin/env bash
saxonpath='/home/thanneken/java/saxon/saxon-he-12.3.jar'
echo "Using ${saxonpath}"
echo "Creating spreadsheet of words (words.csv)"
java -jar ${saxonpath} -s:tei.xml -xsl:tei2csv.xsl -o:words.csv -dtd:on
echo "Done deriving CSV from tei.xml"

