<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/>
    <xsl:template match="/">
        <xsl:result-document indent="yes" href="../Sources/letterList.txt">
            <list>
                <xsl:for-each select="$input">
                    <xsl:sort select=".//head//@standard"/>
                    <xsl:apply-templates select=".//pers[@role='sender'][1]"/>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates select=".//head//date"/>
                    <xsl:text>
</xsl:text>
                </xsl:for-each>
            </list>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>