<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="input" select="collection('../XML/?select*.xml')"/>
    <xsl:template match="/">
        
        <xsl:result-document method="xhtml" indent="yes" href="../Site/dean.html">
            
            <html>
                <head><title>My page</title></head>
                <body>
                    <h1>Letters</h1>
                    <xsl:for-each select="$input">
                        <h2><xsl:apply-templates select=".//head/date"/></h2>
                        <p><i><xsl:apply-templates select=".//head/location"/></i></p>
                        <p><u><xsl:apply-templates select=".//head//salutation"/></u></p>
                        <p><xsl:apply-templates select=".//body"/></p>
                        <hr/>
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                </body>
            </html>
            
        </xsl:result-document>
        
    </xsl:template>
    
</xsl:stylesheet>