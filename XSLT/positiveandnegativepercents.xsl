<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/>
    
    <xsl:template match = "/">
        <xsl:result-document method="xhtml" indent="yes" href="../Site/percentsposandneg.html">
           
            <html>
                <head>
                    <title>Positive and Negative emotions percentage</title>
                    <link type="text/css" rel="stylesheet" href="../Web_Design/CSS_Civil_War_Diaries.css"/>   
                </head>
                    <body>
                        <h1>Civil War Diaries</h1>
                        <h1>Percentage of Positive and Negative Emotions in each Letter</h1>
                        
                        
                    </body>
    
            
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>