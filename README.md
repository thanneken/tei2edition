# TEI to Scholarly Edition (tei2edition)

Create a scholarly edition with multiple visualizations from a single file in TEI (Text Encoding Initiative)

Preview a two-page sample of three visualizations of Latin Moses:

- [Mirador](https://thanneken.github.io/tei2edition/mirador.html)
- [Print](https://thanneken.github.io/tei2edition/text.pdf)
- [Hypertext](https://thanneken.github.io/tei2edition/text.html)

---

This repository collects files used by the Jubilees Palimpsest Project to create a scholarly edition of Latin Moses. 
The template provided here could be used to create scholarly editions of other texts. 

Latin Moses is a collection of writings attributed to Moses preserved in Latin in a single manuscript copied in the fifth century and palimpsested (rescraped to copy a new text) in the eighth century. 
The collection includes what scholars call Latin Jubilees (also preserved in Ethiopic and some Dead Sea Scroll fragments) and the Testament of Moses (not otherwise preserved). 
For more on the broader project, see https://palimpsest.stmarytx.edu. 

The concept is to use TEI for all semantic content and derive multiple visualizations from a single source. 
The concept is intended to provide simplicity and eliminate conflicting information. 
That is, if a word is changed in the single source it will be changed in all the derivatives. 
There are three major visualizations and some additional tools for scholarship. 

The first major visualization is in Mirador. 
The Mirador visualization focuses on images of the manuscript. 
It includes layers for calibrated color, raking illumination, and multispectral (MSI) enhancements. 
It also includes transcriptions of each line, linked to the hypertext edition below. 
In TEI, this requires the `facsimile` element and its children `surface`, `graphic`, and `line`.

The second major visualization is in print, or its near counterpart static PDF. 
This visualization follows familiar conventions. 
The Latin text and English translation are aligned on facing pages. 
The Latin side includes an apparatus and the English side includes footnotes. 
Punctuation, capitalization, abbreviations, etc. are normalized for ease of reading. 
Paragraphs follow conceptual expectations of a modern reader. 
This requires TEI encoding that distinguishes the manuscript visualization from the edited visualization. 
TEI paragraph elements (`p`) indicate modern conceptual divisions, while ekthesis in the manuscript is an attribute of a line beginning (`lb`).
A sentence element (`s`) is visualized as capitalized first letter and a closing period.
Punctuation characters (`pc`) have attributes indicating whether they are from the manuscript or editors. 
Capitalization relies on elements `s`, `persName`, and `placeName`.
The transformation from TEI to PDF goes by way of LATEX.

The third major visualization is the hypertext edition. 
The hypertext edition is interactive and meant to be experienced on screen, not printed. 
Color, hover, and click often provide additional information. 
The layout visualizes the line, column, and page breaks of the manuscript. 
Whereas the print edition prioritizes the edited text and puts the manuscript variation in the apparatus, 
the hypertext edition prioritizes the manuscript evidence and offers corrections in the apparatus. 
Nomina sacra and abbreviations are presented as seen in the manuscript and expanded in hover text. 
Aids to the reader include chapter and verse milestones, apparatus, hyphens when a line breaks inside a word, and links to Perseus morphological analysis.
In TEI, this requires elements such as `pb`, `cb`, `lb`, `choice`, `abbr`, etc.

Two additional tools are included here for the work of editing, not for end users. 
The first additional tool is a spreadsheet of all words in the text. 
The spreadsheet includes the five words preceding and following. 
The location in the manuscript is given as page, column, and line.
The location in scholarly convention is given as chapter and verse. 
Other attributes include whether the word is from the manuscript or editors, is a place name, and is a person name.
Using the filter and sort functions in software such as Microsoft Excel provides information associated with concordances and other tools.
The second additional tool is a DOCX file for Microsoft Word. 
The apparatus and notes are presented inline with the text and the visualization is generally light on formatting.

## Files

Of all the files included in this repository, only one bears content specific to Latin Moses. 
One could create an entirely different scholarly edition by editing only `tei.xml`. 
It may be likely that adjustments to other files would be inevitable. 
The vision is that a humanist willing to learn TEI could do the vast majority of the work in a single file and rely on collaboration for minor adjustments in visualization. 
All files are explained following.

### Files to edit for content

`tei.xml` contains all the semantic information about Latin Moses, including its edited text, its manuscript evidence, and its translation. 
The version on the GitHub repository includes only the first two (preserved) pages. 
This is mostly for the sake of simplicity, but also because access to the remaining 94 pages remains to be established in conversation with the publisher of the print edition. 

### Files for processing require minor adjustments

The Python file requires very light editing to indicate the base URI for Mirador and the hypertext edition. 
Three BASH files require very light editing to indicate the path to Saxon. 
The BASH files also provide TEI validity checking. 

- `tei2iiif.py` for Mirador (IIIF Presentation manifest and annotations)
- `derivecsv.bash`  for the spreadsheet of words
- `derivehtml.bash` for the hypertext edition
- `derivepdf.bash` for the “print” edition
- `derivedocx.bash` for the Microsoft Word tool

All dependencies are freely available, common, and well supported.
XSLT transformation to Latex, HTML, and CSV relies on Saxon (on Java).
Transformation to Mirador relies on Python and a few common modules for XML and JSON.
The BASH shell should work in MacOS terminal, WSL on Windows, and Linux. 
TEI validity checking relies on xmlstarlet. 
Conversion from latex to PDF relies on xelatex.

Some humanists may find this section daunting, but changes to these files could be made by a technical collaborator in a matter of minutes. 

### Files one could edit to adjust the visualization

Changes to these files could be very simple or very complex. 

- `tei2html.xsl` specifies the visualization of the hypertext edition.
- `tei2latex.xsl` specifies the visualization of the “print” edition.
- `tei2csv.xsl` specifies the information presented in the spreadsheet of words.
- `tei2docx.xsl` specifies the visualization for the Microsoft Word tool.
- `tei_tc.odd` is the more human readable file for validating the TEI encoding. If you add TEI elements not already included (and get a validation error) you could add them here. 

### Output files only for visualization, not to be edited

The following files are not meant to be edited. 
If you do edit them (e.g., the spreadsheet), be sure to save it to a different location because the scripts above will overwrite the files. 

- `mirador.html` loads Mirador and the Presentation manifest. Other instances of Mirador are fully interoperable.
- `iiif/manifest.json` is the IIIF Presentation manifest providing the information for visualization in Mirador.
- `iiif/<annotations>.json` are the annotation files that provide line-by-line transcription mapped to the images of the manuscript.
- `ooxml/' is the directory of files used to build the DOCX file. Only `document.xml` is overwritten by `derivedocx.bash`.
- `text.latex` is the intermediary file between TEI and PDF. It is editable, but in principle it would be better to make changes in `tei.xml` or `tei2latex.xsl`.
- `text.pdf` is the “print’ edition.
- `text.html` is the hypertext edition.
- `words.csv` is the spreadsheet of words. 
- `text.docx` is the Microsoft Word tool.
- `tei_tc.dtd` is the not very human readable file for validating the TEI encoding. Changes to the ODD file above will be applied by the BASH scripts.

### Files about the repository

Two files describe the GitHub repository.

- `README.md` is the file you are reading now.
- `LICENSE` specifies that you may use this repository but please give credit to Todd Hanneken.

## Roadmap

Improvements are planned for the Microsoft Word DOCX tool, but it is not planned to be polished for end users.

The XSL files accumulated across time and should be cleaned up. 

## Credit

The XSL files rely on the [Stylesheets](https://github.com/TEIC/Stylesheets) released by the TEI Consortium for education and inspiration. 
The code for transformation to latex (for PDF) builds on the code written by Marjorie Burghart for the TEI Critical Apparatus Toolbox.

The work presented here has been made possible by the generous support of the U.S. National Endowment for the Humanities ([NEH](http://www.neh.gov/)). 

![NEH Logo](https://palimpsest.stmarytx.edu/2023/NEH-Preferred-Seal-Alpha.png)

