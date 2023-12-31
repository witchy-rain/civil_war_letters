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
        
        <xsl:result-document method="xhtml" indent="yes" href="../Site/confederateletters.html">
            
            <html>
                <head>
                    <title>Confederate</title>
                    <link type="text/css" href="../Web_Design/CSS_Civil_War_Diaries.css" rel="stylesheet" />
                </head>
                
                <body>
                    <h1>Civil War Diaries</h1>
                    
                    
                    <div id="navbar"  style="position: sticky; top:0">
                        <div class="navbar">
                            <a href="../index.html">Home</a>
                            <div class="dropdown">
                                <button class="dropbtn">About</button>
                                <div class="dropdown-content">
                                    <a href="About_the_Project.html">About the Project</a>
                                    <a href="team.html">Team</a>
                                    <a href="advancedTL.html">Timeline</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button class="dropbtn">Region</button>
                                <div class="dropdown-content">
                                    <a href="unionletters.html">Union</a>
                                    <a href="confederateletters.html">Confederates</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button class="dropbtn">Analysis</button>
                                <div class="dropdown-content">
                                    <a href="graphs.html">Emotion Graph</a>
                                    <a href="percentage-graphs.html">Emotion Percentage Graph</a>
                                    <a href="percentsposandneg.html">Positive/Negative Emotion Graph</a>
                                    
                                </div>
                            </div>                
                        </div>
                    </div>  
                    <h1>Confederate Letters</h1>
                    <xsl:for-each select="$input[//pers[@role='sender'][@allegiance='c']]">
                        <xsl:sort select=".//head//@standard"/>
                        <hr id="{.//head//@standard}"/>
                        <br/>
                        <h2><xsl:apply-templates select=".//head/date/@month"/><xsl:text> </xsl:text><xsl:apply-templates select=".//head/date/@day"/>, <xsl:apply-templates select=".//head/date/@year"/></h2>
                        <p><i><xsl:apply-templates select=".//head/location"/></i></p>
                        <p><xsl:apply-templates select=".//head/sal"/></p>
                        <p><u><xsl:apply-templates select=".//head/pers"/></u></p>
                        <p><xsl:apply-templates select=".//body"/></p>
                        <p><xsl:apply-templates select=".//close"/></p>
                        <p>(length:  <xsl:apply-templates select="string-length(.//body)"/>)</p>
                        <br/>
                    </xsl:for-each>
                    <br/>
                    <div width="300px" height="400px" style="position: fixed; bottom: 250px; right: 50px"><iframe src="simpleTL.html" title="iFrame Page Nav" height="400px" width="300px"></iframe></div>
                    <img src="../Web_Design/Confederate_Letter_Image.jpg" alt="Confederate envelope with flag and executive names" width="300" style="position:fixed; right: 50px; bottom: 50px"/>
                    <table class="footer" width=" 100%" style="position: fixed; left: 0; bottom: 0; background-color: #BFBFBF; text-align: center; font-size: 24px" bordercolor="#1F0F5F" border="5px"><tr><th>Key:</th> <td><span class="happy">Happy</span></td> <td><span class="sad">Sad</span></td> <td><span class="angry">Angry</span></td> <td><span class="bittersweet">Bittersweet</span></td> <td><span class="hopeful">Hopeful</span></td> <td><span class="afraid">Afraid</span></td> <td><span class="disgusted">Disgusted</span></td> <td><span class="hopeless">Hopeless</span></td> <td><span class="triumphant">Triumphant</span></td> <td><span class="defiant">Defiant</span></td> <td><span class="defeated">Defeated</span></td> <td><span class="yielding">Yielding</span></td></tr></table>
                </body>
            </html>
            
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template match="emotion[@mood='happy']">
        <span class="happy"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='sad']">
        <span class="sad"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='bittersweet']">
        <span class="bittersweet"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='angry']">
        <span class="angry"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='afraid']">
        <span class="afraid"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='digusted']">
        <span class="digusted"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='hopeful']">
        <span class="hopeful"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='hopeless']">
        <span class="hopeless"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='triumphant']">
        <span class="triumphant"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='defiant']">
        <span class="defiant"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='defeated']">
        <span class="defeated"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="emotion[@mood='yielding']">
        <span class="yielding"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>