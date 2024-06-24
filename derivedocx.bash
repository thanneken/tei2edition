#!/usr/bin/env bash
saxonpath='/home/thanneken/java/saxon/saxon-he-12.3.jar'
teisource='tei.xml'
transformation='tei2docx.xsl'
outfile='ooxml/word/document.xml'
java -jar ${saxonpath} -s:${teisource} -xsl:${transformation} -o:${outfile}
cd ooxml/
zip -rD ../text.docx *
cd -
