<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/> <!--whc: insert the correct file path for your context-->
    <xsl:template match="/"> <!--whc: you can call the variable anything; make sure it matches from the variable definition line to where you call for it-->
        
        <xsl:result-document method="xhtml" indent="yes" href="../Site/malinowski.html"> <!--whc: insert the correct file path and file name for your context-->
            
            <html>
                <head><title>My page</title></head>
                <body>
                    <h1>Letters</h1>
                    <xsl:for-each select="$input">
                        <h2><xsl:apply-templates select = "//head/date"/></h2>
                        <h3><i><xsl:apply-templates select = "//head/location"/></i></h3>
                        <h4><u><xsl:apply-templates select = "//head/pers"/></u></h4>
                        
                        <p><xsl:apply-templates select = "//body"/></p>
                        <hr/>
                    </xsl:for-each>
                </body>
            </html>
            
        </xsl:result-document>
        
    </xsl:template>
    
</xsl:stylesheet>