<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:oxy="http://www.oxygenxml.com/ns/doc/xsl">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<!--<xsl:preserve-space elements="tei:p"/>-->

	<oxy:doc><desc>Deprecated Experiments</desc></oxy:doc>
	<!--<xsl:template match="text()"><xsl:value-of select="normalize-space(.)"/></xsl:template>-->

	<oxy:doc><desc>HTML head, body frame, and h1</desc></oxy:doc>
	<xsl:template match="/tei:TEI" mode="#all">
		<xsl:element name="html">
			<xsl:attribute name="lang">
				<xsl:choose>
					<xsl:when test="/tei:TEI/tei:text/@xml:lang">
						<xsl:value-of select="/tei:TEI/tei:text/@xml:lang"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>en</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:element name="head">
				<xsl:element name="meta">
					<xsl:attribute name="name"><xsl:text>viewport</xsl:text></xsl:attribute>
					<xsl:attribute name="content"><xsl:text>width=device-width, initial-scale=1.0</xsl:text></xsl:attribute>
				</xsl:element>
				<xsl:element name="title">
					<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
				</xsl:element>
				<xsl:element name="style">
					<xsl:text>&#10;.trh{color:darkblue;}</xsl:text>
					<xsl:text>&#10;.hr{color:darkred;}</xsl:text>
					<xsl:text>&#10;.dtg{color:indigo;}</xsl:text>
					<xsl:text>&#10;.amc,.Ceriani1861{color:darkgreen;}</xsl:text>
					<xsl:text>&#10;.amd{color:green;}</xsl:text>
					<xsl:text>&#10;.rhc{color:brown;}</xsl:text>
					<xsl:text>&#10;.ocp{color:red;}</xsl:text>
					<xsl:text>&#10;.pb{color:darkblue;font-style:italic;}</xsl:text>
					<xsl:text>&#10;.am{color:purple;font-style:italic;}</xsl:text>
					<xsl:text>&#10;#backmatter{color:darkblue;}</xsl:text>
					<xsl:text>&#10;.pagenum{color:green;}</xsl:text>
					<xsl:text>&#10;.pagegap,.chargap{color:red;}</xsl:text>
					<xsl:text>&#10;body{font-size:130%;margin-top:1em;margin-bottom:1em;background-color:linen;}</xsl:text>
					<xsl:text>&#10;p,div.poetry{line-height:150%;padding-left:0.5em;}</xsl:text>
					<!--
					experiments with position:absolute
					<xsl:text>&#10;.vstext{color:blue;position:absolute;left:2.1em;font-size:70%;text-indent:0;line-height:130%;}</xsl:text>
					<xsl:text>&#10;.chtext{color:blue;position:absolute;left:0;font-size:130%;text-indent:0;}</xsl:text>
					<xsl:text>&#10;p.hanging,p.ekthesis{margin: 0 0 0 0;position:absolute;left:5em;text-indent:-0.5em;}</xsl:text>
					-->
					<xsl:text>&#10;.chtext{color:blue;float:left;margin-left:-2.5em;font-size:130%;text-indent:0;}</xsl:text>
					<xsl:text>&#10;.chtrans{color:blue;float:left;margin-left:-2em;font-size:130%;}</xsl:text>
					<xsl:text>&#10;.vstext{color:blue;float:left;margin-left:-2.5em;font-size:70%;line-height:130%;text-indent:0;}</xsl:text>
					<xsl:text>&#10;.vstrans{color:blue;vertical-align:super;font-size:70%;line-height:0;padding-right:0.2em;}</xsl:text>
					<xsl:text>&#10;.noindent,.normal{margin: 0 0 0 0;padding-left:4em;}</xsl:text>
					<xsl:text>&#10;p.hanging,p.ekthesis{margin: 0 0 0 0;padding-left:4em;text-indent:-0.5em;}</xsl:text>
					<xsl:text>&#10;p.eisthesis{margin: 0 0 0 0;padding-left:4em;text-indent:3em;}</xsl:text>
					<xsl:text>&#10;p.orphan{margin: 0 0 0 0;padding-left:4em;text-indent:6em;}</xsl:text>
					<xsl:text>&#10;.unmarked{margin: 0 0 0 0;padding-left:4em;text-indent:4em;}</xsl:text>
					<xsl:text>&#10;.translation{text-indent:2em;}</xsl:text>
					<xsl:text>&#10;.sic{}</xsl:text>
					<xsl:text>&#10;.corr,.add{text-decoration:none;color:purple;}</xsl:text>
					<xsl:text>&#10;.surplus{text-decoration:line-through;color:darkred;}</xsl:text>
					<xsl:text>&#10;.unclear{color:gray;font-style:italic;}</xsl:text>
					<xsl:text>&#10;.vacat{font-style:italic;}</xsl:text>
					<xsl:text>&#10;div.leftcol{display:inline-block;position:relative;}</xsl:text>
					<xsl:text>&#10;div.rightcol{display:inline-block;vertical-align:top;position:relative;}</xsl:text>
					<xsl:text>&#10;div.note{padding-top:0.3em;margin-top:0.3em;border-top: 1px solid black;}</xsl:text>
					<xsl:text>&#10;p.note{padding-left:0.5em;text-indent:-0.5em;margin-top:0;margin-bottom:0;}</xsl:text>
					<xsl:text>&#10;div.noteblock{border:1px solid gray;margin:1em;padding:1em;border-radius:1em;font-size:90%;}</xsl:text>
					<xsl:text>&#10;p.bibliography{padding-left:3em;text-indent:-3em;}</xsl:text>
					<xsl:text>&#10;p.header{padding-left:2em;text-indent:-2em;margin: 0.2em 0 0.2em 0;}</xsl:text>
					<xsl:text>&#10;a{text-decoration:inherit;color:inherit;}</xsl:text>
					<xsl:text>&#10;div.stanza{margin:2em;}</xsl:text>
					<xsl:text>&#10;sup.noteref{color:darkgreen;font-size:75%;line-height:0;}</xsl:text>
					<xsl:text>&#10;span.romannum{}</xsl:text>
					<xsl:text>&#10;@media(orientation:portrait){body{width:100%;margin-left:0;margin-right:0;}div.leftcol{width:100%;}div.rightcol{width:100%}div.rightcol::before{content:'col. b';}}</xsl:text>
					<xsl:text>&#10;@media(orientation:landscape){body{max-width:40em;margin-left:auto;margin-right:auto;}div.leftcol{width:18em;}}&#10;</xsl:text>
				</xsl:element>
			</xsl:element>
			<xsl:element name="body">
				<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
				<xsl:apply-templates select="/tei:TEI/tei:text"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>Headings</desc></oxy:doc>
	<xsl:template match="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" mode="#all">
		<xsl:element name="h1">
			<xsl:if test="@resp">
				<xsl:attribute name="class"><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:body/tei:div/tei:head" mode="#all">
		<xsl:element name="h2">
			<xsl:if test="@resp">
				<xsl:attribute name="class"><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:body/tei:div/tei:div/tei:head" mode="#all">
		<xsl:element name="h3">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:body/tei:div/tei:div/tei:div/tei:head" mode="#all">
		<xsl:element name="h4">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:text/tei:back/tei:div/tei:head" mode="#all">
		<xsl:element name="h2">
			<xsl:text>Appendix </xsl:text>
			<xsl:number level="single" from="/tei:TEI/tei:text/tei:back" count="tei:div" format="A.1. "/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>Text structural elements: p</desc></oxy:doc>
	<xsl:template match="tei:p" mode="#all">
		<xsl:choose>
			<xsl:when test="ancestor::tei:teiHeader">
				<xsl:element name="p">
					<xsl:attribute name="class">
						<xsl:text>header</xsl:text>
					</xsl:attribute>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="ancestor::tei:body">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="ancestor::tei:back">
				<xsl:choose>
					<xsl:when test=".//tei:note">
						<xsl:element name="div">
							<xsl:attribute name="class">noteblock</xsl:attribute>
							<xsl:for-each select=".//tei:note">
								<xsl:for-each select="tei:p">
									<xsl:element name="p">
										<xsl:attribute name="class">note</xsl:attribute>
										<xsl:if test="position() = 1">
											<xsl:element name="sup">
												<xsl:number level="any" from="tei:back" count="tei:note" format="1 "/>
											</xsl:element>
										</xsl:if>
										<xsl:apply-templates/>
									</xsl:element>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="p">
							<xsl:attribute name="class">
								<xsl:text>translation</xsl:text>
							</xsl:attribute>
							<xsl:apply-templates/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>UNANCTICIPATED SCENARIO</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<!--
		OBSOLETE 1/20/2024
		<xsl:element name="p">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@part='F'">
						<xsl:text>noindent</xsl:text>
					</xsl:when>
					<xsl:when test="@rend='unmarked'">
						<xsl:text>unmarked</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>hanging</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
		-->
	</xsl:template>

	<oxy:doc><desc>Page, column, and line breaks</desc></oxy:doc>
	<xsl:template match="tei:pb" mode="#all">
		<!-- this covers middle and end, will not trigger on open -->
		<!--<xsl:if test="ancestor::tei:body and ../self::tei:p">-->
		<xsl:if test="ancestor::tei:w">
			<xsl:text disable-output-escaping="yes">&lt;/a&gt;-</xsl:text>
		</xsl:if>
		<!--
		-->
		<xsl:if test="ancestor::tei:body and ancestor::tei:p">
			<!--<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>-->
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="ancestor::tei:body and ancestor::tei:lg">
			<!--<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>-->
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="ancestor::tei:body and preceding-sibling::*[1] = preceding-sibling::tei:p">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="ancestor::tei:body and preceding-sibling::*[1] = preceding-sibling::tei:lg">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<!-- apply templates to notes since the last page break -->
		<xsl:variable name="currentpos"><xsl:value-of select="count(preceding::*)"/></xsl:variable>
		<xsl:variable name="prevpos">
			<xsl:choose>
				<xsl:when test="preceding::tei:pb">
					<xsl:for-each select="preceding::tei:pb[1]">
						<xsl:value-of select="count(preceding::*)"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="tei:text[1]">
						<xsl:value-of select="count(preceding::*)"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--
		1/26/2024 decided all app should be treated at break, not just note 
		<xsl:for-each select="//tei:note[(count(preceding::*) &lt; $currentpos) and (count(preceding::*) &gt; $prevpos)]">
			<xsl:apply-templates select="." mode="atBreak"/>
		</xsl:for-each>
		-->
		<xsl:for-each select="//tei:app[(count(preceding::*) &lt; $currentpos) and (count(preceding::*) &gt; $prevpos)]">
			<xsl:apply-templates select="." mode="atBreak"/>
		</xsl:for-each>
		<xsl:if test="@n != 'end'">
			<xsl:element name="p">
				<xsl:attribute name="class"><xsl:text>pb</xsl:text></xsl:attribute>
				<xsl:text>p. </xsl:text>
				<xsl:value-of select="@n"/>
				<xsl:text> (original p. </xsl:text>
				<xsl:value-of select="@ana"/>
				<xsl:text>)</xsl:text>
			</xsl:element>
			<xsl:text disable-output-escaping="yes">&#10;&lt;div class="leftcol"&gt;</xsl:text>
			<xsl:if test="../self::tei:p">
				<xsl:text disable-output-escaping="yes">&lt;p class="noindent"&gt;</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="tei:cb[@n='a']" mode="#all">
		<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:div/tei:cb[@n='b']" mode="#all">
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;div class="rightcol"&gt;&lt;p class="normal"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:div/tei:p/tei:cb[@n='b']" mode="#all">
		<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;div class="rightcol"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:div/tei:lg/tei:l/tei:cb[@n='b']" mode="#all">
		<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;div class="rightcol"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:div/tei:p/tei:s/tei:cb[@n='b']" mode="#all">
		<!-- s doesn't change anything -->
		<xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;div class="rightcol"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:div/tei:p/tei:s/tei:w/tei:cb[@n='b']" mode="#all">
		<xsl:text disable-output-escaping="yes">-&lt;/a&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;div class="rightcol"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;a&gt;</xsl:text>
	</xsl:template>
	<xsl:template match="tei:lb" mode="#default">
		<xsl:choose>
			<xsl:when test="@rend='ekthesis'">
				<xsl:text disable-output-escaping="yes">&#10;&lt;p class="ekthesis"&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@rend='eisthesis'">
				<xsl:text disable-output-escaping="yes">&#10;&lt;p class="eisthesis"&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@rend='orphan' and parent::tei:w">
				<xsl:text disable-output-escaping="yes">-&lt;/a&gt;&#10;&lt;p class="orphan"&gt;&lt;a&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="@rend='orphan'">
				<xsl:text disable-output-escaping="yes">&#10;&lt;p class="orphan"&gt;</xsl:text>
			</xsl:when>
			<!--<xsl:when test="parent::tei:w and ../tei:cb"/>-->
			<!-- could consider a test if id ends in b1 or a1 -->
			<xsl:when test="ends-with(@xml:id,'a1') or ends-with(@xml:id,'b1')"/>
			<!-- might it come in handy if this skips over empty elements? -->
			<!--
			<xsl:when test="preceding-sibling::tei:cb[1] = preceding-sibling::tei:*[1]"/>
			-->
			<xsl:when test="parent::tei:w or @type='inWord'">
				<xsl:text>-</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:element name="br"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>&#10;</xsl:text>
				<xsl:element name="br"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tei:lb" mode="inNote">
		<xsl:if test="@type='inWord' or parent::tei:w"><xsl:text>-</xsl:text></xsl:if>
	</xsl:template>
			<!--
		<xsl:if test="@type='inWord' or parent::tei:w">
			<xsl:if test="not(../tei:cb)">
				<xsl:text>-</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="@rend='ekthesis'">
				<xsl:text disable-output-escaping="yes">&#10;&lt;p class="ekthesis"&gt;</xsl:text>
			</xsl:when>
			-->
			<!--
				The following works if the tei is encoded specifically to have the cb right before the lb at the same level. 
				It should be possible to write a more flexible test that matches 
				when the nearest previous cb is nearer than the nearest previous lb.
				It would suffice if I could compare the preceding cb to the preceding node that is either cb or lb.
			<xsl:when test="preceding-sibling::tei:cb[1] = preceding-sibling::tei:*[1]">
				<xsl:text disable-output-escaping="yes">&#10;&lt;p class="normal"&gt;</xsl:text>
			</xsl:when>
			-->
			<!--
			<xsl:otherwise>
				<xsl:text>&#10;</xsl:text>
				<xsl:element name="br"/>
			</xsl:otherwise>
		</xsl:choose>
		-->

	<oxy:doc><desc>Milestones for renumbered pages (pulled in with pb, ignore when appears on its own), chapters, and verses</desc></oxy:doc>
	<xsl:template match="tei:milestone[@type='19c']" mode="#all"/>
	<!-- a chapter milestone can appear inside a line (test mos 6)... if neighbor sibling is a lb then format as superscript -->
	<xsl:template match="tei:milestone[@unit='ch']">
		<xsl:element name="span">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="ancestor::tei:body">
						<xsl:attribute name="class">chtext</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">chtrans</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="@n"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:milestone[@unit='vs']">
		<xsl:text>&#10;</xsl:text>
		<xsl:element name="a">
			<xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
			<xsl:attribute name="href"><xsl:value-of select="@corresp"/></xsl:attribute>
			<xsl:element name="span">
				<xsl:choose>
					<xsl:when test="ancestor::tei:body">
						<xsl:attribute name="class">vstext</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">vstrans</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="@n"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:milestone[@unit='msPar']">
			<!--<xsl:text disable-output-escaping="yes">&lt;/p&gt;&#10;&lt;p class="hanging"&gt;</xsl:text>-->
			<xsl:text disable-output-escaping="yes">&#10;&lt;p class="hanging"&gt;</xsl:text>
	</xsl:template>

	<oxy:doc><desc>Gaps</desc></oxy:doc>
	<xsl:template match="tei:gap" mode="#all">
		<xsl:choose>
			<xsl:when test="ancestor::tei:p">
				<xsl:element name="span">
					<xsl:attribute name="class">chargap</xsl:attribute>
					<xsl:text>[</xsl:text>
					<xsl:value-of select="@quantity"/>
					<xsl:text>?]</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="p">
					<xsl:attribute name="class">pagegap</xsl:attribute>
					<xsl:text>[</xsl:text>
					<xsl:value-of select="@quantity"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="@unit"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="@reason"/>
					<xsl:text>]</xsl:text>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<oxy:doc><desc>Backmatter</desc></oxy:doc>
	<xsl:template match="/tei:TEI/tei:text/tei:back" mode="#all">
		<xsl:element name="hr"/>
		<xsl:element name="div">
			<xsl:attribute name="id">backmatter</xsl:attribute>
			<xsl:attribute name="lang"><xsl:value-of select="@xml:lang"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>Bibliography</desc></oxy:doc>
	<xsl:template match="tei:listBibl" mode="#all">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="tei:biblStruct" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>bibliography</xsl:text></xsl:attribute>
			<xsl:choose>
				<xsl:when test="count(*/tei:author) = 0 and count(*/tei:editor) = 3">
					<xsl:value-of select="*/tei:editor[1]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:editor[1]/tei:surname"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="*/tei:editor[2]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:editor[2]/tei:surname"/>
					<xsl:text>, and </xsl:text>
					<xsl:value-of select="*/tei:editor[3]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:editor[3]/tei:surname"/>
					<xsl:text>, eds.</xsl:text>
				</xsl:when>
				<xsl:when test="count(*/tei:author) = 0 and count(*/tei:editor) > 3">
					<xsl:for-each select="*/tei:editor">
						<xsl:value-of select="tei:forename"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="tei:surname"/>
						<xsl:text>, </xsl:text>
					</xsl:for-each>
					<xsl:text> eds.</xsl:text>
				</xsl:when>
				<xsl:when test="count(*/tei:author) = 1">
					<xsl:value-of select="*/tei:author[1]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[1]/tei:surname"/>
				</xsl:when>
				<xsl:when test="count(*/tei:author) = 2">
					<xsl:value-of select="*/tei:author[1]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[1]/tei:surname"/>
					<xsl:text> and </xsl:text>
					<xsl:value-of select="*/tei:author[2]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[2]/tei:surname"/>
				</xsl:when>
				<xsl:when test="count(*/tei:author) = 3">
					<xsl:value-of select="*/tei:author[1]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[1]/tei:surname"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="*/tei:author[2]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[2]/tei:surname"/>
					<xsl:text>, and </xsl:text>
					<xsl:value-of select="*/tei:author[3]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[3]/tei:surname"/>
				</xsl:when>
				<xsl:when test="count(*/tei:author) > 3 ">
					<xsl:value-of select="*/tei:author[1]/tei:forename"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="*/tei:author[1]/tei:surname"/>
					<xsl:text> et al.</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>UNANTICIPATED SITUATION</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>, </xsl:text>
			<xsl:choose>
				<xsl:when test="@type='webpage'">
					<xsl:text>“</xsl:text>
					<xsl:apply-templates select="tei:analytic/tei:title[@level='a']"/>
					<xsl:choose>
						<xsl:when test="tei:monogr/tei:title[@level='m']">
							<xsl:text>.</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>,</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>” </xsl:text>
					<xsl:if test="tei:monogr/tei:title[@level='m']">
						<xsl:apply-templates select="tei:monogr/tei:title[@level='m']"/>
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
					<xsl:text>. </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:note[@type='url']"/>
					<xsl:text>.</xsl:text>
				</xsl:when>
				<xsl:when test="@type='book'">
					<xsl:apply-templates select="tei:monogr/tei:title[@level='m']"/>
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="tei:series"/>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>
					<xsl:text>: </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:publisher"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
					<xsl:text>).</xsl:text>
				</xsl:when>
				<xsl:when test="@type='journalArticle'">
					<xsl:text>“</xsl:text>
					<xsl:apply-templates select="tei:analytic/tei:title[@level='a']"/>
					<xsl:text>,” </xsl:text>
					<xsl:apply-templates select="tei:monogr/tei:title"/>
					<!-- might want to distinguish journal title abbreviations here -->
					<xsl:text> </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='volume']"/>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
					<xsl:text>)</xsl:text>
					<xsl:if test="tei:monogr/tei:imprint/tei:biblScope[@unit='page']">
						<xsl:text>: </xsl:text>
						<xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
					</xsl:if>
					<xsl:text>.</xsl:text>
					<xsl:if test="tei:monogr/tei:imprint/tei:note[@type='url']">
						<xsl:text> </xsl:text>
						<xsl:value-of select="tei:monogr/tei:imprint/tei:note[@type='url']"/>
						<xsl:text>.</xsl:text>
					</xsl:if>
				</xsl:when>
				<xsl:when test="@type='bookSection'">
					<xsl:text>“</xsl:text>
					<xsl:apply-templates select="tei:analytic/tei:title[@level='a']"/>
					<xsl:text>,” in </xsl:text>
					<xsl:apply-templates select="tei:monogr/tei:title[@level='m']"/>
					<xsl:text> (</xsl:text>
					<xsl:choose>
						<xsl:when test="count(tei:monogr/tei:editor) = 0"/>
						<xsl:when test="count(tei:monogr/tei:editor) = 1">
							<xsl:text>ed. </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:surname"/>
							<xsl:text>; </xsl:text>
						</xsl:when>
						<xsl:when test="count(tei:monogr/tei:editor) = 2">
							<xsl:text>ed. </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:surname"/>
							<xsl:text> and </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[2]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[2]/tei:surname"/>
							<xsl:text>; </xsl:text>
						</xsl:when>
						<xsl:when test="count(tei:monogr/tei:editor) = 3">
							<xsl:text>ed. </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:surname"/>
							<xsl:text>, </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[2]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[2]/tei:surname"/>
							<xsl:text>, and </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[3]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[3]/tei:surname"/>
							<xsl:text>; </xsl:text>
						</xsl:when>
						<xsl:when test="count(tei:monogr/tei:editor) > 3 ">
							<xsl:text>ed. </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:forename"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="tei:monogr/tei:editor[1]/tei:surname"/>
							<xsl:text> et al.; </xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>UNANTICIPATED SITUATION</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="tei:series"/>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>
					<xsl:text>: </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:publisher"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
					<xsl:text>)</xsl:text>
					<xsl:if test="tei:monogr/tei:imprint/tei:biblScope[@unit='page']">
						<xsl:text> </xsl:text>
						<xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
					</xsl:if>
					<xsl:text>.</xsl:text>
					<xsl:if test="tei:monogr/tei:imprint/tei:note[@type='url']">
						<xsl:text> </xsl:text>
						<xsl:value-of select="tei:monogr/tei:imprint/tei:note[@type='url']"/>
						<xsl:text>.</xsl:text>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>UNANTICIPATED TYPE</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:series" mode="#all">
		<xsl:apply-templates select="tei:title"/>
		<xsl:if test="tei:biblScope[@unit='volume']">
			<xsl:text> </xsl:text>
			<xsl:value-of select="tei:biblScope[@unit='volume']"/>
		</xsl:if>
		<xsl:text>; </xsl:text>
	</xsl:template>
	<oxy:doc><desc>Italicize title in the context of a bibl</desc></oxy:doc>
	<xsl:template match="tei:title" mode="#all">
		<xsl:choose>
			<xsl:when test="ancestor::tei:biblStruct[@type='webpage']">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@level='m' or @level='j' or parent::tei:bibl or ../tei:title[@level='m']">
				<xsl:element name="i">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<oxy:doc><desc>Prosopography</desc></oxy:doc>
	<xsl:template match="tei:div[@xml:id='prosopography']" mode="#all">
		<xsl:apply-templates/>
		<xsl:element name="dl">
			<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:person" mode="#all">
		<xsl:element name="dt">
			<xsl:attribute name="class"><xsl:text>prosopography</xsl:text></xsl:attribute>
			<xsl:value-of select="tei:persName/tei:surname"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="tei:persName/tei:forename"/>
		</xsl:element>
		<xsl:if test="tei:ptr/@target">
			<xsl:element name="dd">	
				<xsl:apply-templates select="tei:ptr"/>
				<!--
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="tei:ptr/@target"/>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:text>_blank</xsl:text>
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="replace(.,'([A-z]|[0-9])([/_])','$1&#8203;$2')"/>
							</xsl:element>
				-->
			</xsl:element>
		</xsl:if>
	</xsl:template>

	<oxy:doc><desc>Manuscript segments</desc></oxy:doc>
	<xsl:template match="tei:seg[@type='msLine']" mode="#all">
		<xsl:element name="span">
			<xsl:attribute name="id">
				<xsl:value-of select="@xml:id"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>Information from TEI header</desc></oxy:doc>
	<xsl:template match="tei:div[@xml:id='about']" mode="#all">
		<xsl:apply-templates/>
		<xsl:element name="p">
			<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/>
			<xsl:element name="i">
				<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
			</xsl:element>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
			<xsl:text>. </xsl:text>
			<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence"/>
		</xsl:element>
		<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier"/>
		<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents"/>
		<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>
		<xsl:apply-templates select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history"/>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor" mode="#all">
		<xsl:apply-templates select="id(substring-after(@sameAs,'#'))/tei:persName/tei:surname"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="id(substring-after(@sameAs,'#'))/tei:persName/tei:forename"/>
		<xsl:text>, ed., </xsl:text>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier" mode="#all">
		<xsl:element name="p">
			<xsl:text>Based on </xsl:text>
			<xsl:apply-templates select="tei:repository"/>
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="tei:settlement"/>
			<xsl:text>) </xsl:text>
			<xsl:apply-templates select="tei:idno"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents" mode="#all">
		<xsl:element name="ol">
			<xsl:apply-templates select="tei:msItem"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:msItem" mode="#all">
		<xsl:element name="li">
			<xsl:if test="tei:author">
				<xsl:value-of select="tei:author"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="tei:title"/>
			<xsl:for-each select="tei:locus">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="@scheme"/>
				<xsl:text> pages </xsl:text>
				<xsl:value-of select="@from"/>
				<xsl:text>–</xsl:text>
				<xsl:value-of select="@to"/>
			</xsl:for-each>
			<xsl:for-each select="tei:locusGrp">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="@scheme"/>
				<xsl:text> pages</xsl:text>
				<xsl:for-each select="tei:locus">
					<xsl:if test="position() != 1">
						<xsl:text>,</xsl:text>
					</xsl:if>
					<xsl:text> </xsl:text>
					<xsl:value-of select="@from"/>
					<xsl:text>–</xsl:text>
					<xsl:value-of select="@to"/>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="tei:msItem">
				<xsl:element name="ol">
					<xsl:attribute name="type"><xsl:text>a</xsl:text></xsl:attribute>
					<xsl:apply-templates select="tei:msItem"/>
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:support" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>header</xsl:text></xsl:attribute>
			<xsl:text>Support: </xsl:text>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:extent" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>header</xsl:text></xsl:attribute>
			<xsl:text>Extent: </xsl:text>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:dimensions" mode="#all">
		<xsl:text> Typical </xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:text> height </xsl:text>
		<xsl:value-of select="tei:height/@quantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tei:height/@unit"/>
		<xsl:text>. Typical </xsl:text>
		<xsl:value-of select="@type"/>
		<xsl:text> width </xsl:text>
		<xsl:value-of select="tei:width/@quantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="tei:width/@unit"/>
		<xsl:text>.</xsl:text>
	</xsl:template>
	<xsl:template match="tei:signatures" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>header</xsl:text></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:layout" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>header</xsl:text></xsl:attribute>
			<xsl:apply-templates select="id(substring-after(@corresp,'#'))/tei:title"/>
			<xsl:text> ruled with </xsl:text>
			<xsl:value-of select="@ruledLines"/>
			<xsl:text> lines and </xsl:text>
			<xsl:value-of select="@columns"/>
			<xsl:text> columns.</xsl:text>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:handNote" mode="#all">
		<xsl:element name="p">
			<xsl:attribute name="class"><xsl:text>header</xsl:text></xsl:attribute>
			<xsl:apply-templates select="id(substring-after(@corresp,'#'))/tei:title"/>
			<xsl:text> writing:</xsl:text>
		</xsl:element>
		<xsl:apply-templates/>
	</xsl:template>

	<oxy:doc><desc>PTR can be an external url or an internal reference to bibliography</desc></oxy:doc>
	<xsl:template match="tei:ptr[@target]" mode="#all">
		<xsl:choose>
			<xsl:when test="contains(substring(@target,1,4),'http')">
				<xsl:element name="a">
					<xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="replace(@target,'([A-z]|[0-9])([/_])','$1&#8203;$2')"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="contains(substring(@target,1,1),'#')">
				<xsl:text>THIS IS AN INTERNAL POINTER</xsl:text> 
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>UNANTICIPATED SITUATION</xsl:text> 
			</xsl:otherwise> 
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tei:ref[@target]" mode="#all">
		<xsl:choose>
			<xsl:when test="contains(substring(@target,1,4),'http')">
				<xsl:element name="a">
					<xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="replace(.,'([A-z]|[0-9])([/_])','$1&#8203;$2')"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="contains(substring(@target,1,1),'#')">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>UNANTICIPATED SITUATION</xsl:text> 
			</xsl:otherwise> 
		</xsl:choose>
	</xsl:template>

	<oxy:doc><desc>Link words with xml:lang="la" to Perseus</desc></oxy:doc>
	<xsl:template match="tei:w" mode="#all">
		<xsl:choose>
			<xsl:when test="ancestor-or-self::tei:*[@xml:lang='la'][1]">
				<!--
				<xsl:if test="preceding-sibling::tei:w[1] = preceding-sibling::tei:*[1] 
				or preceding-sibling::*[1]//tei:w 
				or ../preceding-sibling::tei:w[1] = ../preceding-sibling::tei:*[1]">
				-->
				<xsl:if test="ancestor-or-self::tei:w[1] = ancestor-or-self::tei:*[1]
					or ../preceding-sibling::*[1]//tei:w">
					<xsl:text>&#10;</xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="descendant::tei:pb">
						<xsl:text disable-output-escaping="yes">&lt;a class="perseus" target="perseus" href="https://www.perseus.tufts.edu/hopper/morph?la=la</xsl:text><xsl:text>&amp;l=</xsl:text><xsl:choose>
							<xsl:when test="@lemma">
								<xsl:value-of select="@lemma"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose><xsl:text disable-output-escaping="yes">"&gt;</xsl:text>
						<xsl:apply-templates mode="#current"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="a">
							<xsl:attribute name="class"><xsl:text>perseus</xsl:text></xsl:attribute>
							<xsl:attribute name="target"><xsl:text>perseus</xsl:text></xsl:attribute>
							<xsl:attribute name="href">
								<xsl:text>https://www.perseus.tufts.edu/hopper/morph?la=la&amp;l=</xsl:text>
								<xsl:choose>
									<xsl:when test="@lemma">
										<xsl:value-of select="@lemma"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="."/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:apply-templates mode="#current"/>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="preceding-sibling::tei:w[1] = preceding-sibling::tei:*[1]">
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:apply-templates mode="#current"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="@part='I'">
			<xsl:text>-</xsl:text>
		</xsl:if>
	</xsl:template>
	<!--
	<xsl:template match="tei:choice" mode="#default">
		<xsl:if test="preceding-sibling::tei:w[1] = preceding-sibling::tei:*[1]">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates mode="#current"/>
		<xsl:if test="following-sibling::tei:w[1] = following-sibling::tei:*[1]">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	-->

	<oxy:doc><desc>Capitalization... not in html but will want for critical edition</desc></oxy:doc>
	<!--
	<xsl:template match="tei:persName|tei:placeName">
		<xsl:for-each select="tei:w">
			 <xsl:sequence select="concat(upper-case(substring(.,1,1)),substring(.,2))"/>
		</xsl:for-each>
	</xsl:template>
	-->

	<oxy:doc><desc>Editorial work... deprecated except for unclear and still using add for punctuation... change to app?</desc></oxy:doc>
	<xsl:template match="tei:sic" mode="#all">
		<xsl:if test="node()">
			<xsl:element name="span">
				<xsl:attribute name="class"><xsl:text>sic</xsl:text></xsl:attribute>
				<xsl:apply-templates mode="#current"/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:corr" mode="#all">
		<xsl:if test="node()">
			<xsl:element name="span">
				<xsl:attribute name="class"><xsl:text>corr </xsl:text><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
				<xsl:attribute name="title">
					<xsl:apply-templates select="id(substring-after(@resp,'#'))/tei:persName/tei:surname"/>
				</xsl:attribute>
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:abbr" mode="#default">
		<xsl:element name="span">
			<xsl:attribute name="title">
				<xsl:value-of select="../tei:expan"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:expan" mode="#all"/>
	<xsl:template match="tei:add" mode="#all">
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:text>add </xsl:text><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
			<xsl:attribute name="title">
				<xsl:apply-templates select="id(substring-after(@resp,'#'))/tei:persName/tei:surname"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:surplus" mode="#default">
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="." mode="inNote"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="tei:surplus" mode="inNote">
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:text>surplus </xsl:text><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
			<xsl:attribute name="title">
				<xsl:apply-templates select="id(substring-after(@resp,'#'))/tei:persName/tei:surname"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:unclear" mode="#all">
		<xsl:element name="span">
			<xsl:attribute name="class"><xsl:text>unclear </xsl:text><xsl:value-of select="substring-after(@resp,'#')"/></xsl:attribute>
			<xsl:attribute name="title">
				<xsl:apply-templates select="id(substring-after(@resp,'#'))/tei:persName/tei:surname"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:space" mode="#all">
		<xsl:element name="span">
			<xsl:attribute name="class">vacat</xsl:attribute>
			<xsl:text> vacat </xsl:text>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>Apparatus</desc></oxy:doc>
	<xsl:template match="tei:app">
		<xsl:choose>
			<!-- if first rdg is empty then is a surplus -->
			<xsl:when test="tei:rdg[1] and not(tei:rdg[1]/node())">
				<xsl:element name="span">
					<xsl:attribute name="class"><xsl:text>surplus </xsl:text><xsl:value-of select="substring-after(tei:rdg/@source,'#')"/></xsl:attribute>
					<xsl:attribute name="title">
						<xsl:apply-templates select="id(substring-after(tei:rdg/@source,'#'))/tei:persName/tei:surname"/>
					</xsl:attribute>
					<xsl:apply-templates select="tei:lem"/>
				</xsl:element>
			</xsl:when>
			<!-- when there is no rdg that means it is just a note -->
			<xsl:when test="not(tei:rdg[1])">
				<xsl:apply-templates select="tei:lem"/>
			</xsl:when>
			<!-- when lem is empty or non-existent that means rdg is a conjecture -->
			<xsl:when test="not(tei:lem/node()) or not(tei:lem)">
				<!-- earlier version had a choice with 1 word just inserted and 2 or more indicated with +, 4/14/2024 think always + is better -->
				<xsl:element name="span">
					<xsl:attribute name="class"><xsl:value-of select="substring-after(tei:rdg[1]/@source,'#')"/></xsl:attribute>
					<xsl:attribute name="title">
						<xsl:apply-templates select="id(substring-after(tei:rdg/@source,'#'))/tei:persName/tei:surname"/>
						<xsl:text>: </xsl:text>
						<xsl:apply-templates select="tei:rdg[1]"/>
					</xsl:attribute>
					<xsl:text> + </xsl:text>
				</xsl:element>
			</xsl:when>
			<!-- otherwise strike lem and give rdg -->
			<!-- 1/26/2024 changed to give only lem, save rdg for apparatus -->
			<xsl:otherwise>
				<xsl:apply-templates select="tei:lem"/>
				<!--
				<xsl:element name="span">
					<xsl:attribute name="class"><xsl:text>sic</xsl:text></xsl:attribute>
				</xsl:element>
				<xsl:element name="span">
					<xsl:attribute name="class"><xsl:text>corr </xsl:text><xsl:value-of select="substring-after(tei:rdg/@source,'#')"/></xsl:attribute>
					<xsl:attribute name="title">
						<xsl:apply-templates select="id(substring-after(tei:rdg/@source,'#'))/tei:persName/tei:surname"/>
					</xsl:attribute>
					<xsl:apply-templates select="tei:rdg[1]"/>
				</xsl:element>
				-->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<oxy:doc>><desc>Text and Translation Notes</desc></oxy:doc>
	<xsl:template match="tei:div[@xml:id='translation']" mode="#all">
		<xsl:apply-templates/>
	</xsl:template>
	<oxy:doc><desc>Translation notes numbered from beginning of back</desc></oxy:doc>
	<xsl:template match="tei:back//tei:note">
		<xsl:element name="sup">
			<xsl:attribute name="class">
				<xsl:text>noteref</xsl:text>
			</xsl:attribute>
			<xsl:number level="any" from="tei:back" count="tei:note" format="1"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:body//tei:note" mode="#default"/>
	<!-- 
	1/26/2024 decided that all app should be treated as break, not just notes 
	<xsl:template match="tei:body//tei:note" mode="atBreak">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:text>note </xsl:text>
				<xsl:value-of select="substring-after(@resp,'#')"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:apply-templates select="id(substring-after(@resp,'#'))/tei:persName/tei:surname"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="ancestor::tei:body">
					<xsl:for-each select="preceding::tei:milestone[@unit='vs'][1]">
						<xsl:element name="b">
							<xsl:value-of select="@n"/>
						</xsl:element>
						<xsl:text> </xsl:text>
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="../tei:lem/node()">
							<xsl:apply-templates select="../tei:lem" mode="inNote"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>+ </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>] </xsl:text>
					<xsl:apply-templates select="../tei:rdg[1]" mode="inNote"/>
					<xsl:text> </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>CONFUSED ABOUT HOW TO FORMAT THIS NOTE</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	--> 
	<xsl:template match="tei:body//tei:app" mode="atBreak">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:text>note </xsl:text>
				<xsl:for-each select="tei:rdg/@source">
					<xsl:value-of select="substring-after(.,'#')"/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
				<xsl:value-of select="substring-after(tei:note[1]/@resp,'#')"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:for-each select="tei:rdg/@source">
					<xsl:apply-templates select="id(substring-after(.,'#'))/tei:persName/tei:surname"/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="ancestor::tei:body">
					<xsl:for-each select="preceding::tei:milestone[@unit='vs'][1]">
						<xsl:element name="b">
							<xsl:value-of select="@n"/>
						</xsl:element>
						<xsl:text> </xsl:text>
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="tei:lem/node()">
							<xsl:apply-templates select="tei:lem" mode="inNote"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>+ </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>] </xsl:text>
					<xsl:for-each select="tei:rdg">
						<!-- <xsl:apply-templates select="." mode="inNote"/> -->
						<xsl:apply-templates select="."/> 
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="id(substring-after(./@source,'#'))/tei:persName/tei:surname"/>
						<xsl:text>. </xsl:text>
					</xsl:for-each>
					<xsl:apply-templates select="tei:note" mode="inNote"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>CONFUSED ABOUT HOW TO FORMAT THIS NOTE</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<!--
			<xsl:apply-templates/>
			-->
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:note" mode="inNote">
		<xsl:apply-templates/>
		<xsl:text> </xsl:text>
	</xsl:template>

	<oxy:doc><desc>Poetry</desc></oxy:doc>
	<xsl:template match="tei:back/tei:div/tei:lg/tei:l">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:text>poetry</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:back/tei:div/tei:lg">
		<xsl:element name="div">
			<xsl:attribute name="class">stanza</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<oxy:doc><desc>foreign for Greek, Hebrew, and other</desc></oxy:doc>
	<xsl:template match="tei:foreign">
		<xsl:choose>
			<xsl:when test="@xml:lang='el'">
				<xsl:element name="span">
					<xsl:attribute name="class">greek</xsl:attribute>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>	
			<xsl:when test="@xml:lang='he'">
				<xsl:element name="span">
					<xsl:attribute name="class">hebrew</xsl:attribute>
					<xsl:text disable-output-escaping="yes">&amp;rlm;</xsl:text>
						<xsl:value-of select="normalize-space()"/>
					<xsl:text disable-output-escaping="yes">&amp;lrm;</xsl:text>
				</xsl:element>
			</xsl:when>	
			<xsl:otherwise>
				<xsl:element name="i">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="tei:pc"/>
	<xsl:template match="tei:pc[@type='ms']">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:num">
		<xsl:element name="span">
			<xsl:attribute name="title">
				<xsl:value-of select="@value"/>
			</xsl:attribute>
			<xsl:attribute name="class">
				<xsl:text>romannum</xsl:text>
			</xsl:attribute>
			<xsl:text> </xsl:text>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
