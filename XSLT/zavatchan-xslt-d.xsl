<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/>
    <xsl:template match="/"> <!--whc: you can call the variable anything; make sure it matches from the variable definition line to where you call for it-->
        
        <xsl:result-document method="xhtml" indent="yes" href="../Site/zavatchan.html"> <!--whc: insert the correct file path and file name for your context-->
            
            <html>
                <head><title>My page</title></head>
                <body>
                    <h1>Letters</h1>
                    <xsl:for-each select="$input">
                        <xsl:sort select=".//head//@standard"/>
                        <h2><xsl:apply-templates select=".//head/date/@month"/><xsl:text> </xsl:text><xsl:apply-templates select=".//head/date/@day"/>, <xsl:apply-templates select=".//head/date/@year"/></h2>
                        <p><i><xsl:apply-templates select=".//head/location"/></i></p>
                        <p><u><xsl:apply-templates select=".//head/pers"/></u></p>
                        <p><xsl:apply-templates select=".//body"/></p>
                        <p><xsl:apply-templates select=".//close"/></p>
                        <p>(length:  <xsl:apply-templates select="string-length(.//body)"/>)</p>
                        <hr/>
                    </xsl:for-each>
                    <!--whc: your xsl:apply-templates, xsl:for-each, etc. to create page content go here, the filepath starting with $input -->
                </body>
            </html>
            
        </xsl:result-document>
        
    </xsl:template>
    
</xsl:stylesheet>