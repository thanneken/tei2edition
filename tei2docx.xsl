<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="3.0"
	exclude-result-prefixes="#all"
>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/tei:TEI">
		<xsl:element name="w:document">
			<xsl:element name="w:body">
				<xsl:element name="w:p">
					<xsl:element name="w:pPr">
						<xsl:element name="w:pStyle">
							<xsl:attribute name="w:val">
								<xsl:text>Title</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
					<xsl:element name="w:r">
						<xsl:element name="w:t">
							<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
				<xsl:apply-templates select="/tei:TEI/tei:text/tei:back/tei:div[1]"/>
				<xsl:element name="w:sectPr">
					<xsl:element name="w:pgSz">
						<xsl:attribute name="w:w">
							<xsl:text>12240</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:h">
							<xsl:text>15840</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="w:pgMar">
						<xsl:attribute name="w:top">
							<xsl:text>1440</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:right">
							<xsl:text>1440</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:bottom">
							<xsl:text>1440</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:left">
							<xsl:text>1440</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:header">
							<xsl:text>720</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:footer">
							<xsl:text>720</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="w:gutter">
							<xsl:text>0</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="w:cols">
						<xsl:attribute name="w:space">
							<xsl:text>720</xsl:text>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="w:docGrid">
						<xsl:attribute name="w:linePitch">
							<xsl:text>360</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:*/tei:div/tei:head">
		<xsl:element name="w:p">
			<xsl:element name="w:pPr">
				<xsl:element name="w:pStyle">
					<xsl:attribute name="w:val">
						<xsl:text>Heading1</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:r">
				<xsl:element name="w:t">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:*/tei:div/tei:div/tei:head">
		<xsl:element name="w:p">
			<xsl:element name="w:pPr">
				<xsl:element name="w:pStyle">
					<xsl:attribute name="w:val">
						<xsl:text>Heading2</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:r">
				<xsl:element name="w:t">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:p | tei:lg ">
		<xsl:element name="w:p">
			<xsl:element name="w:r">
				<xsl:element name="w:t">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:l">
		<xsl:apply-templates/>
		<xsl:if test="following-sibling::tei:*[1] = following-sibling::tei:l[1]">
			<xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;&lt;w:r&gt;&lt;w:br/&gt;&lt;w:t&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:s/tei:w[1] | tei:q/tei:w[1]">
		<xsl:choose>
			<xsl:when test="../@part='F'">
				<xsl:text>…</xsl:text>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat(upper-case(substring(.,1,1)),substring(.,2))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tei:s">
		<xsl:apply-templates/>
		<xsl:choose>
			<xsl:when test="@part='I'">
				<xsl:text>… </xsl:text>
			</xsl:when>
			<xsl:when test="tei:q[position()=last()]">
				<xsl:text>.” </xsl:text>
			</xsl:when>
			<xsl:when test="parent::tei:q and not(following-sibling::tei:*)"/>
			<xsl:otherwise>
				<xsl:text>. </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tei:q">
		<xsl:text>, “</xsl:text>
		<xsl:apply-templates/>
		<xsl:if test="following-sibling::tei:*">
			<xsl:text>”</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:w | tei:num">
		<xsl:if test="
									preceding-sibling::tei:w[1] = preceding-sibling::tei:*[1] 
									or ../preceding-sibling::*[1]//tei:w
									or preceding-sibling::*[1]//tei:w 
									or preceding-sibling::tei:pc = preceding-sibling::tei:*[1]
									or preceding-sibling::tei:lb = preceding-sibling::tei:*[1]
									">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:persName/tei:w | tei:placeName/tei:w">
		<xsl:text> </xsl:text>
		<xsl:sequence select="concat(upper-case(substring(.,1,1)),substring(.,2))"/>
	</xsl:template>
	<xsl:template match="tei:milestone[@unit='vs']">
		<xsl:text> </xsl:text>
		<xsl:for-each select="preceding::tei:milestone[@unit='ch'][1]">
			<xsl:value-of select="@n"/>
		</xsl:for-each>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="@n"/>
		<xsl:text>&#160;</xsl:text>
	</xsl:template>
	<!--
	<xsl:template match="tei:milestone[@unit='vs']">
		<xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text>
		<xsl:element name="w:r">
			<xsl:element name="w:t">
				<xsl:attribute name="xml:space">
					<xsl:text>preserve</xsl:text>
				</xsl:attribute>
				<xsl:text> </xsl:text>
			</xsl:element>
		</xsl:element>
		<xsl:element name="w:r">
			<xsl:element name="w:rPr">
				<xsl:element name="w:rStyle">
					<xsl:attribute name="w:val">
						<xsl:text>VerseNumber</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:t">
				<xsl:value-of select="@n"/>
				<xsl:text>&#160;</xsl:text>
			</xsl:element>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">&lt;w:r&gt;&lt;w:t&gt;</xsl:text>
	</xsl:template>
	-->
	<xsl:template match="tei:app">
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>
		<xsl:if test="following-sibling::tei:*">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:lem">
		<xsl:text>[</xsl:text>
		<xsl:value-of select="substring-after(@wit,'#')"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<xsl:template match="tei:rdg">
		<xsl:text>[</xsl:text>
		<xsl:apply-templates select="id(substring-after(@source,'#'))/tei:persName/tei:surname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<xsl:template match="tei:app/tei:note">
		<xsl:text>[</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:back/tei:div/tei:div/tei:p/tei:note/tei:p">
		<xsl:text>[</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<!--
	<xsl:template match="tei:app/tei:note">
		<xsl:text disable-output-escaping="yes">&lt;/w:t&gt;&lt;/w:r&gt;</xsl:text>
		<xsl:element name="w:r">
			<xsl:element name="w:rPr">
				<xsl:element name="w:rStyle">
					<xsl:attribute name="w:val">
						<xsl:text>FootnoteReference</xsl:text>
					</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<xsl:element name="w:footnoteReference">
				<xsl:attribute name="w:id">
					<xsl:number level="single" from="/tei:TEI/tei:text/tei:body" count="tei:app/tei:note" format="1"/>
				</xsl:attribute>
			</xsl:element>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">&lt;w:r&gt;&lt;w:t&gt;</xsl:text>
	</xsl:template>
	-->
	<xsl:template match="tei:gap">
		<xsl:choose>
			<xsl:when test="ancestor::tei:p"> 
				<xsl:text>…</xsl:text>
			</xsl:when>
			<xsl:otherwise/> <!-- consider how to indicate lost pages in print --> 
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tei:abbr"/>
	<xsl:template match="tei:sic"/>
	<xsl:template match="tei:pc[@type='ms']"/>
</xsl:stylesheet>

