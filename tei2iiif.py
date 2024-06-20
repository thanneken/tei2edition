#!/usr/bin/env python
import json
import lxml.etree as ET

baseUri = 'https://thanneken.github.io/tei2edition/iiif'
hypertext = 'https://thanneken.github.io/tei2edition/text.html'
print("Using URI %s"%(baseUri))
teiFile = 'tei.xml'
ns = {'tei':'http://www.tei-c.org/ns/1.0','xml':'http://www.w3.org/XML/1998/namespace'}
terminalElements = [ 
	'{http://www.tei-c.org/ns/1.0}lb' , 
	'{http://www.tei-c.org/ns/1.0}cb' , 
	'{http://www.tei-c.org/ns/1.0}pb' 
]
wordLikeElements = [ 
	'{http://www.tei-c.org/ns/1.0}w' 
]
diggingElements = [ 
	'{http://www.tei-c.org/ns/1.0}s' , 
	'{http://www.tei-c.org/ns/1.0}q' , 
	'{http://www.tei-c.org/ns/1.0}app' , 
	'{http://www.tei-c.org/ns/1.0}lem' , 
	'{http://www.tei-c.org/ns/1.0}placeName' , 
	'{http://www.tei-c.org/ns/1.0}persName' , 
	'{http://www.tei-c.org/ns/1.0}choice' , 
	'{http://www.tei-c.org/ns/1.0}abbr' 
]

def linestring(xmlid): # start with a line beginning called by id and build the annotation for that line to display in Mirador
	linestring = ""
	current = root.find(".//tei:lb[@xml:id='"+xmlid+"']",ns)
	while True:
		if current.getparent().tag in wordLikeElements: # if we're starting in the middle of a word present a hyphen and remaining text
			linestring = "%s-%s "%(linestring,current.tail)
		if current.tag in diggingElements: # look into descendants if we're expecting words inside
			current = current.xpath("descendant::*[1]",namespaces=ns)[0]
		else: # otherwise take the next element
			current = current.xpath("following::*[1]",namespaces=ns)[0]
		if current.tag in terminalElements: # if we reached a break we're done constructing this line
			break
		elif current.xpath("@unit='vs'",namespaces=ns):  # if this is a verse number present it in square brackets
			linestring = "%s[%s] "%(linestring,current.get('n'))
		elif current.tag in wordLikeElements and current.xpath("descendant::tei:lb",namespaces=ns): # if this word contains a break present the first part and a hyphen
			linestring = "%s%s-"%(linestring,current.text)
			break
		elif current.tag in wordLikeElements: # present text of this element and descendants such as tei:unclear
			linestring = "%s%s "%(linestring,"".join(current.itertext()))
	linestring = "<a target=\"text\" href=\"%s#%s\">%s</a>"%(hypertext,xmlid,linestring) # link to hypertext edition
	lang = current.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	return linestring , lang

tree = ET.parse(teiFile)
root = tree.getroot()
defaultLang = root.find('.//*[@xml:lang]',ns).get('{http://www.w3.org/XML/1998/namespace}lang')
if defaultLang is None:
	defaultLang = 'none'

manifest = {
	'@context' : ['http://iiif.io/api/presentation3/context.json'],
	'id' : baseUri+'/manifest.json',
	'type' : 'Manifest'
}

for title in root.findall('.tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title',ns):
	if not 'label' in manifest:
		manifest['label'] = {}
	lang = title.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['label'].update( { lang : [ title.text ] }  )

for edition in root.findall('.tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition',ns):
	if not 'summary' in manifest:
		manifest['summary'] = {}
	lang = edition.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['summary'].update( { lang : [ edition.text ] }  )

for author in root.findall('.tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author',ns):
	if not 'metadata' in manifest:
		manifest['metadata'] = []
	lang = author.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['metadata'].append( { "label" : { lang : [ "author" ] } , "value" : { lang : [ author.text ] } })

for editor in root.findall('.tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor',ns):
	if not 'metadata' in manifest:
		manifest['metadata'] = []
	lang = editor.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['metadata'].append( { "label" : { lang : [ "editor" ] } , "value" : { lang : [ editor.text ] } })

for publisher in root.findall('.tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher',ns):
	if not 'provider' in manifest:
		manifest['provider'] = []
	lang = publisher.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['provider'].append(
		{
			"id" : publisher.get('ref'),
			"type" : "Agent",
			"label" : { lang : [ publisher.text ] },
			"homepage" : [
				{
					"id" : publisher.get('ref'),
					"type" : "Text",
					"label": { "none" : [ publisher.get('ref') ] },
					"format" : "text/html"
				}
			],
			"logo" : [
				{
					"id" : publisher.find('tei:graphic',ns).get('url'),
					"type" : "Image",
					"format" : "image/jpg",
					"width" : int(publisher.find('tei:graphic',ns).get('width')),
					"height:" : int(publisher.find('tei:graphic',ns).get('height')),
					"service": [
						{
							"id" : publisher.find('./tei:graphic',ns).get('url').split('/full')[0],
							"type" : "ImageService3",
							"profile" : "level2"
						}
					]
				}
			]
		}
	)
	manifest["homepage"] = [
		{
			"id" : publisher.get('ref'),
			"type" : "Text",
			"label": { "none" : [ publisher.get('ref') ] },
			"format" : "text/html"
		}
	]
	
for date in root.findall('.tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date',ns):
	manifest['metadata'].append( { "label" : { 'en' : [ 'Date' ] } , "value" : { 'none' : [ date.text ] } } )

for lic in root.findall('.tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence',ns):
	manifest["rights"] = lic.find('./tei:ref',ns).get('target')

for attribution in root.findall('.tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:ab',ns):
	lang = attribution.xpath("ancestor-or-self::tei:*[@xml:lang][1]",namespaces=ns)[0].get('{http://www.w3.org/XML/1998/namespace}lang')
	manifest['requiredStatement'] = {
		"label" : { lang : [ "Attribution" ] },
		"value" : { lang : [ attribution.text ] }
	}
	 
manifest['items'] = []
for surface in root.findall('.tei:facsimile/tei:surface',ns):
	canvasId = baseUri+'/manifest.json/'+surface.get('{http://www.w3.org/XML/1998/namespace}id')
	print("Canvas ID is %s"%(canvasId))
	layers = []
	for graphic in surface.findall('.tei:graphic',ns):
		layers.append(
			{
				"id" : graphic.get('url'),
				"type" : "Image",
				"format" : "image/jpeg",
				"width" : int(graphic.get('width')),
				"height" : int(graphic.get('height')),
				"label" : { defaultLang : [ graphic.get('n') ] },
				"service" : [
					{
						"id" : graphic.get('url').split('/full')[0],
						"type" : "ImageService3",
						"profile" : "level2" 
					}
				]
			}
		)
	manifest['items'].append(
		{
			"id" : canvasId,
			"type" : "Canvas",
			"label" : { 
				"none" : [ surface.get('n') ] 
			},
			"height" : int(surface.get('lry')),
			"width" : int(surface.get('lrx')),
			"items" : [
				{
					"id" : canvasId+'/annotationpage',
					"type" : "AnnotationPage",
					"items" : [
						{
							"@context" : "http://iiif.io/api/presentation/3/context.json", 
							"id" : canvasId+'/annotationpage/cube',
							"type" : "Annotation",
							"motivation" : "painting",
							"target" : canvasId,
							"body" : {
								"type" : "Choice",
								"items" : layers 
							}
						}
					]
				}
			],
			"annotations" : [
				{
					"id" : baseUri+'/'+surface.get('{http://www.w3.org/XML/1998/namespace}id')+'.json',
					"type" : "AnnotationPage"
				}
			]
		}
	)

print("Writing manifest file manifest.json")
with open('iiif/manifest.json','w') as outfile:
	outfile.write(json.dumps(manifest,indent=2))

for surface in root.findall('.tei:facsimile/tei:surface',ns): 
	canvasId = baseUri+'/manifest.json/'+surface.get('{http://www.w3.org/XML/1998/namespace}id')
	annotationPageId = baseUri+'/'+surface.get('{http://www.w3.org/XML/1998/namespace}id')+'.json'
	annotationPage = {
		'@context' : ['http://iiif.io/api/presentation3/context.json'],
		"id" : annotationPageId,
		"type" : "AnnotationPage",
		"items" : []
	}
	for media in surface.findall('.tei:media',ns):
		annotationPage['items'].append(
			{
				"id" : "%s/%s.json/%s"%(baseUri,surface.get('{http://www.w3.org/XML/1998/namespace}id'),media.get('{http://www.w3.org/XML/1998/namespace}id')),
				"type" : "Annotation",
				"motivation": "commenting",
				"target" : canvasId+"#xywh=%s,%s,%s,%s"%(surface.get('ulx'),surface.get('uly'),int(surface.get('lrx'))-int(surface.get('ulx')),int(surface.get('lry'))-int(surface.get('uly'))),
				"body": [
					{
						"type" : "TextualBody",
						"language" : "none" ,
						"value" : "<a href=\"%s\" target=\"_blank\">%s</a>"%(media.get('url'),media.get('type'))
					}
				]
			}
		)
	for line in surface.findall('.tei:line',ns):
		lineAnnotation , lang = linestring(line.get('corresp').split('#')[-1])
		annotationPage['items'].append(
			{
				"id" : "%s/%s.json/%s"%(baseUri,surface.get('{http://www.w3.org/XML/1998/namespace}id'),line.get('{http://www.w3.org/XML/1998/namespace}id')),
				"type" : "Annotation",
				"motivation": "commenting",
				"target" : canvasId+"#xywh=%s,%s,%s,%s"%(line.get('ulx'),line.get('uly'),int(line.get('lrx'))-int(line.get('ulx')),int(line.get('lry'))-int(line.get('uly'))),
				"body": [
					{
						"type" : "TextualBody",
						"language" : lang ,
						"value" : lineAnnotation
					}
				]
			}
		)

	print("Writing annotation file %s.json"%(surface.get('{http://www.w3.org/XML/1998/namespace}id')))
	with open('iiif/'+surface.get('{http://www.w3.org/XML/1998/namespace}id')+'.json','w') as outfile:
		outfile.write(json.dumps(annotationPage,indent=2))

