<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:tei="http://www.tei-c.org/ns/1.0" 
	xmlns:oxy="http://www.oxygenxml.com/ns/doc/xsl">

	<oxy:doc><desc>Produces spreadsheet of all words</desc></oxy:doc>
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" byte-order-mark="yes" />
	<xsl:strip-space elements="*"/>

	<xsl:template match="tei:teiHeader"/>
	<xsl:template match="tei:back"/>
	<xsl:template match="tei:note"/>
	<xsl:template match="tei:pc"/>
	<xsl:template match="tei:head"/>

	<xsl:template match="tei:text">
		<xsl:text>CHAPTER,VERSE,5cPAGE,19cPAGE,COL,LINE,PRECEDING,WORD,LEMMA,FOLLOWING,PART,PERSON,PLACE,WITNESS,READING&#10;</xsl:text>
		<xsl:for-each select="//tei:w">
			<xsl:for-each select="preceding::tei:milestone[@unit='ch'][1]">
				<xsl:value-of select="@n"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="preceding::tei:milestone[@unit='vs'][1]">
				<xsl:value-of select="@n"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="preceding::tei:pb[1]">
				<xsl:value-of select="@ana"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="preceding::tei:pb[1]">
				<xsl:value-of select="@n"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="preceding::tei:lb[1]">
				<xsl:value-of select="substring(@xml:id,5,1)"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="preceding::tei:lb[1]">
				<xsl:value-of select="substring(@xml:id,6)"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="preceding::tei:w[5]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="preceding::tei:w[4]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="preceding::tei:w[3]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="preceding::tei:w[2]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="preceding::tei:w[1]"/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="."/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="@lemma"/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="following::tei:w[1]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="following::tei:w[2]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="following::tei:w[3]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="following::tei:w[4]"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="following::tei:w[5]"/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="@part"/>
			<xsl:text>,</xsl:text>
			<xsl:if test="ancestor::tei:persName">
				<xsl:text>TRUE</xsl:text>
			</xsl:if>
			<xsl:text>,</xsl:text>
			<xsl:if test="ancestor::tei:placeName">
				<xsl:text>TRUE</xsl:text>
			</xsl:if>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="ancestor::tei:lem[1]">
				<xsl:value-of select="substring-after(@wit,'#')"/>
			</xsl:for-each>
			<xsl:text>,</xsl:text>
			<xsl:for-each select="ancestor::tei:rdg[1]">
				<xsl:apply-templates select="id(substring-after(@source,'#'))/tei:persName/tei:surname"/>
			</xsl:for-each>

			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>

