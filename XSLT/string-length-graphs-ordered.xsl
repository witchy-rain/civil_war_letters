<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!--whc: This is an attempt to put into practice the model at 
        https://stackoverflow.com/questions/29950622/xslt-how-to-access-previous-group
        with the goal of ordering the sequence of lines in the graph according to length.
        So far it is not successful.-->
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name = "interval" select = "200"/> <!-- change to fit number of bars -->
    <xsl:variable name= "xmultiplier" select =".35"/>
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/>
    
    <xsl:template match = "/">
        <xsl:result-document method="xhtml" indent="yes" href="../Site/graphs-ordered.html">
            <html>
                <head>
                    <title>Character Count of Emotions by Speech</title>
                    <link type="text/css" rel="stylesheet" href="../Web_Design/CSS_Civil_War_Diaries.css"/>
                </head>
                
                <body>
                    <h1>Civil War Diaries</h1>
                    <!--navbar-->
                    <!--<div id="navbar">
                    <div class="navbar">
                        <a href="/state_of_the_union/index.html">Home</a>
                        <div class="dropdown">
                            <button class="dropbtn">About</button>
                            <div class="dropdown-content">
                                <a href="/state_of_the_union/html/about.html">About the Project</a>
                                <a href="/state_of_the_union/html/team.html">Team</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="dropbtn">Original Texts</button>
                            <div class="dropdown-content">
                                <a href="/state_of_the_union/html/scope_toc.html">Project Scope (John F. Kennedy to George W. Bush)</a>
                                <a href="/state_of_the_union/html/non_scope_toc.html">All Addresses (George Washington to George W. Bush</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="dropbtn">Analysis</button>
                            <div class="dropdown-content">
                                <a href="/state_of_the_union/html/graphs.html">Topic Reference Graphs By Mention</a>
                                <a href="/state_of_the_union/html/percentgraphs.html">Topic Reference Graphs By Percentage</a>
                                <a href="/state_of_the_union/html/speechlengthgraph.html">Average Address Length By President</a>
                                <a href="/state_of_the_union/html/discussion.html">Discussion</a>                      
                            </div>
                        </div>                
                    </div>
                </div>  -->
                    <h1>Emotion Count Per Speech</h1>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 6000">
                        <g transform="translate(250, 50)">
                            
                            <!-- to do == flip names so they come from top, add numbers on top axis, fit all names on the graph-->
                            <!-- y-axis -->
                            <line x1="20" x2="20" y1="0" y2="{(59 * $interval) - 1620}" stroke="black" stroke-width="1"/>
                            <!-- x-axis (bottom) -->
                            <line x1="20" x2="1020" y1="{(59 * $interval) - 1620}" y2="{(59 * $interval) - 1620}" stroke="black" stroke-width="1"/>
                            <!-- x-axis (top)-->
                            <line x1="20" x2="1020" y1="0" y2="0" stroke="black" stroke-width="1"/>
                            
                            <!-- labels the x-axis (bottom) -->
                            <text x="20" y="{(59 * $interval) - 1600}" text-anchor="middle">0</text>
                            <text x="70" y="{(59 * $interval) - 1600}" text-anchor="middle">1000</text>
                            <text x="120" y="{(59 * $interval) - 1600}" text-anchor="middle">2000</text>
                            <text x="170" y="{(59 * $interval) - 1600}" text-anchor="middle">3000</text>
                            <text x="220" y="{(59 * $interval) - 1600}" text-anchor="middle">4000</text>
                            <text x="270" y="{(59 * $interval) - 1600}" text-anchor="middle">5000</text>
                            <text x="320" y="{(59 * $interval) - 1600}" text-anchor="middle">6000</text>
                            <text x="370" y="{(59 * $interval) - 1600}" text-anchor="middle">7000</text>
                            <text x="420" y="{(59 * $interval) - 1600}" text-anchor="middle">8000</text>
                            <text x="470" y="{(59 * $interval) - 1600}" text-anchor="middle">9000</text>
                            <text x="520" y="{(59 * $interval) - 1600}" text-anchor="middle">10000</text>
                            <text x="570" y="{(59 * $interval) - 1600}" text-anchor="middle">11000</text>
                            <text x="620" y="{(59 * $interval) - 1600}" text-anchor="middle">12000</text>
                            <text x="670" y="{(59 * $interval) - 1600}" text-anchor="middle">13000</text>
                            <text x="720" y="{(59 * $interval) - 1600}" text-anchor="middle">14000</text>
                            <text x="770" y="{(59 * $interval) - 1600}" text-anchor="middle">15000</text>
                            <text x="820" y="{(59 * $interval) - 1600}" text-anchor="middle">16000</text>
                            <text x="870" y="{(59 * $interval) - 1600}" text-anchor="middle">17000</text>
                            <text x="920" y="{(59 * $interval) - 1600}" text-anchor="middle">18000</text>
                            <text x="970" y="{(59 * $interval) - 1600}" text-anchor="middle">19000</text>
                            <text x="1020" y="{(59 * $interval) - 1600}" text-anchor="middle">20000</text>
                            
                            <!-- labels the x-axis (top) -->
                            <text x="20" y="-10" text-anchor="middle">0</text>
                            <text x="70" y="-10" text-anchor="middle">1000</text>
                            <text x="120" y="-10" text-anchor="middle">2000</text>
                            <text x="170" y="-10" text-anchor="middle">3000</text>
                            <text x="220" y="-10" text-anchor="middle">4000</text>
                            <text x="270" y="-10" text-anchor="middle">5000</text>
                            <text x="320" y="-10" text-anchor="middle">6000</text>
                            <text x="370" y="-10" text-anchor="middle">7000</text>
                            <text x="420" y="-10" text-anchor="middle">8000</text>
                            <text x="470" y="-10" text-anchor="middle">9000</text>
                            <text x="520" y="-10" text-anchor="middle">10000</text>
                            <text x="570" y="-10" text-anchor="middle">11000</text>
                            <text x="620" y="-10" text-anchor="middle">12000</text>
                            <text x="670" y="-10" text-anchor="middle">13000</text>
                            <text x="720" y="-10" text-anchor="middle">14000</text>
                            <text x="770" y="-10" text-anchor="middle">15000</text>
                            <text x="820" y="-10" text-anchor="middle">16000</text>
                            <text x="870" y="-10" text-anchor="middle">17000</text>
                            <text x="920" y="-10" text-anchor="middle">18000</text>
                            <text x="970" y="-10" text-anchor="middle">19000</text>
                            <text x="1020" y="-10" text-anchor="middle">20000</text>
                            
                            <!-- the line going through the bars  -->
                            <line x1="70" x2="70" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="120" x2="120" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="170" x2="170" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="220" x2="220" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="270" x2="270" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="320" x2="320" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="370" x2="370" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="420" x2="420" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="470" x2="470" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="520" x2="520" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="570" x2="570" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="620" x2="620" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="670" x2="670" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="720" x2="720" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="770" x2="770" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="820" x2="820" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="870" x2="870" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="920" x2="920" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="970" x2="970" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="1020" x2="1020" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            
                            
                            <!-- Instead stead of using xsl:apply-templates and creating another xsl:template match, we use xsl:for-each -->
                            <xsl:for-each select="$input">
                                <!-- Local variables -->
                                <xsl:variable name="ypos" select="position() * $interval"/>
                                <!--  <xsl:variable name="xpos" select="(count(descendant::emotion[@mood]) *20 )+20"/>-->
                                
                                <xsl:variable name="happy" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'happy'])))*$xmultiplier+20"/>
                                <xsl:variable name="sad" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'sad'])))*$xmultiplier+20"/>
                                <xsl:variable name="angry" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry'])))*$xmultiplier+20"/>
                                <xsl:variable name="bittersweet" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'bittersweet'])))*$xmultiplier+20"/>
                                <xsl:variable name="hopeful" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeful'])))*$xmultiplier+20"/>
                                <xsl:variable name="afraid" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'afraid'])))*$xmultiplier+20"/>
                                <xsl:variable name="disgusted" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'disgusted'])))*$xmultiplier+20"/>
                                <xsl:variable name="hopeless" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeless'])))*$xmultiplier+20"/>
                                <xsl:variable name="triumphant" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'triumphant'])))*$xmultiplier+20"/>
                                <xsl:variable name="defiant" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant'])))*$xmultiplier+20"/>
                                <xsl:variable name="defeated" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defeated'])))*$xmultiplier+20"/>
                                <xsl:variable name="yielding" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'yielding'])))*$xmultiplier+20"/>
                                
                                <xsl:variable name="moods">
                                    <xsl:for-each-group select="descendant::emotion" group-by="@mood">
                                        <mood moodname="{./@mood}">
                                            <xsl:copy-of select="current-group()"/>
                                        </mood>
                                    </xsl:for-each-group>
                                </xsl:variable>
                                
                                <xsl:for-each select="$moods/mood">
                                    <xsl:sort select="string-length(normalize-space(string-join(string())))"/>
                                    <xsl:variable name="mood-pos" select="count(preceding-sibling::mood)"/>
                                    <xsl:variable name="length" select="string-length(normalize-space(string-join(string())))"/>
                                    <xsl:variable name="mood-name" select="@moodname"/>
                                    
                                    <line x1="20" x2="{$length*$xmultiplier+20}" y1="{$mood-pos * 15}" y2="{$mood-pos * 15}" stroke="blue" stroke-width="15"/>
                                    <text x="{$length*$xmultiplier + 10}" y="{$mood-pos * 15 +5}">
                                        <xsl:apply-templates select="@mood"/> <xsl:text>: </xsl:text>
                                        <xsl:value-of select="$length"/>
                                    </text>
                                    
                                </xsl:for-each>
                                
                                <!--<xsl:for-each-group select="descendant::emotion" group-by="@mood">


                                </xsl:for-each-group>-->
                                
                                
                                    <!--<line x1="20" x2="{$happy}" y1="{$ypos}" y2="{$ypos}" stroke="yellow" stroke-width="15"/>
                                <text x="{$happy + 10}" y="{$ypos+5}">
                                    Happy: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'happy'])))"/>
                                </text>-->
                                
                                
                                <!--<line x1="20" x2="{$sad}" y1="{$ypos+15}" y2="{$ypos+15}" stroke="blue" stroke-width="15"/>
                                <line x1="20" x2="{$angry}" y1="{$ypos+30}" y2="{$ypos+30}" stroke="red" stroke-width="15"/>
                                <line x1="20" x2="{$bittersweet}" y1="{$ypos+45}" y2="{$ypos+45}" stroke="orange" stroke-width="15"/>
                                <line x1="20" x2="{$hopeful}" y1="{$ypos+60}" y2="{$ypos+60}" stroke="green" stroke-width="15"/>
                                <line x1="20" x2="{$afraid}" y1="{$ypos+75}" y2="{$ypos+75}" stroke="cyan" stroke-width="15"/>
                                <line x1="20" x2="{$disgusted}" y1="{$ypos+90}" y2="{$ypos+90}" stroke="violet" stroke-width="15"/>
                                <line x1="20" x2="{$hopeless}" y1="{$ypos+105}" y2="{$ypos+105}" stroke="navy" stroke-width="15"/>
                                <line x1="20" x2="{$triumphant}" y1="{$ypos+120}" y2="{$ypos+120}" stroke="Aqua" stroke-width="15"/>
                                <line x1="20" x2="{$defiant}" y1="{$ypos+135}" y2="{$ypos+135}" stroke="Coral" stroke-width="15"/>
               -->
                                
                      <!--          <text x="{$sad + 10}" y="{$ypos + 20}">
                                    Sad: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'sad'])))"/>
                                </text>
                                
                                <text x="{$angry + 10}" y="{$ypos+ 35}">
                                    Angry: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry'])))"/>
                                </text>
                                
                                <text x="{$bittersweet + 10}" y="{$ypos + 50}">
                                    Bittersweet: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'bittersweet'])))"/>
                                </text>
                                
                                <text x="{$hopeful + 10}" y="{$ypos + 65}">
                                    Hopeful: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeful'])))"/>
                                </text>
                                
                                <text x="{$afraid + 10}" y="{$ypos + 80}">
                                    Afraid: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry'])))"/>
                                </text>
                                
                                <text x="{$disgusted + 10}" y="{$ypos + 95}">
                                    Disgusted: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'disgusted'])))"/>
                                </text>
                                
                                <text x="{$hopeless + 10}" y="{$ypos + 110}">
                                    Hopeless: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeless'])))"/>
                                </text>
                                
                                <text x="{$triumphant + 10}" y="{$ypos + 125}">
                                    Triumphant: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'triumphant'])))"/>
                                </text>
                                
                                <text x="{$defiant + 10}" y="{$ypos + 140}">
                                    Defiant: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant'])))"/>
                                </text>-->
                                
                                <!--y-axis label -->
                                <text x="15" y="{$ypos+35}" text-anchor="end"><xsl:apply-templates select="//(letter//pers[@role='sender'])[1]"/>-<xsl:apply-templates select = "date"/></text>
                                
                            </xsl:for-each>
                        </g>
                    </svg>
                    
                    
                    <footer>
                        <br/>
                        <p><a href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="/state_of_the_union/pics/propercclicense.png" alt="state_of_the_union/pics/cclicense.png"></img></a></p>
                        <p><a href="https://github.com/finn-caskey/state_of_the_union">SOTU Team Github Here</a></p>
                        <br/>
                        <br/>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>