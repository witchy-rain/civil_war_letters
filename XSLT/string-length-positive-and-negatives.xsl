<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name = "interval" select = "220"/> <!-- change to fit number of bars -->
    <xsl:variable name= "xmultiplier" select =".160"/>
    <xsl:variable name="input" select="collection('../XML/?select=*.xml')"/>
    <xsl:variable name="lettercount" select="count($input)+.25"/>
    <xsl:variable name="xmultiplier2" select = ".160"/>   
    <xsl:variable name="xmultiplier3" select = ".05"/>
    <xsl:template match = "/">
        <xsl:result-document method="xhtml" indent="yes" href="../Site/percentsposandneg.html">
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
                    <h1>Positive, Negative, and Neutral Emotions Per Speech</h1>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 6000">
                        <g transform="translate(250, 50)">
                            
                            <!-- to do == flip names so they come from top, add numbers on top axis, fit all names on the graph-->
                            <!-- y-axis -->
                            <line x1="20" x2="20" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width="1"/>
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
                            <text x="{(1*$xmultiplier)+20}" y="-10" text-anchor="middle">0</text>
                            <!--<text x="{(250*$xmultiplier)+20}" y="-10" text-anchor="middle">250</text>-->
                            <text x="{(500*$xmultiplier)+20}" y="-10" text-anchor="middle">500</text>
                            <!--<text x="{(750*$xmultiplier)+20}" y="-10" text-anchor="middle">750</text>-->
                            <text x="{(1000*$xmultiplier)+20}" y="-10" text-anchor="middle">1000</text>
                            <!--<text x="{(1250*$xmultiplier)+20}" y="-10" text-anchor="middle">1250</text>-->
                            <text x="{(1500*$xmultiplier)+20}" y="-10" text-anchor="middle">1500</text>
                            <!--<text x="{(1750*$xmultiplier)+20}" y="-10" text-anchor="middle">1750</text>-->
                            <text x="{(2000*$xmultiplier)+20}" y="-10" text-anchor="middle">2000</text>
                            <!--<text x="{(2250*$xmultiplier)+20}" y="-10" text-anchor="middle">2250</text>-->
                            <text x="{(2500*$xmultiplier)+20}" y="-10" text-anchor="middle">2500</text>
                            <!--<text x="{(2750*$xmultiplier)+20}" y="-10" text-anchor="middle">2750</text>-->
                            <text x="{(3000*$xmultiplier)+20}" y="-10" text-anchor="middle">3000</text>
                            <text x="{(3500*$xmultiplier)+20}" y="-10" text-anchor="middle">3500</text>
                            <text x="{(4000*$xmultiplier)+20}" y="-10" text-anchor="middle">4000</text>
                            <text x="{(4500*$xmultiplier)+20}" y="-10" text-anchor="middle">4500</text>
                            <text x="{(5000*$xmultiplier)+20}" y="-10" text-anchor="middle">5000</text>
                            <text x="{(5500*$xmultiplier)+20}" y="-10" text-anchor="middle">5500</text>
                            <text x="{(6000*$xmultiplier)+20}" y="-10" text-anchor="middle">6000</text>
                            
                            <!-- the line going through the bars  -->
                            <!--<line x1="{(250*$xmultiplier)+20}" x2="{(250*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval) }" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(500*$xmultiplier)+20}" x2="{(500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval) }" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <!--<line x1="{(750*$xmultiplier)+20}" x2="{(750*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval) }" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(1000*$xmultiplier)+20}" x2="{(1000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <!--<line x1="{(1250*$xmultiplier)+20}" x2="{(1250*$xmultiplier)+20}" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(1500*$xmultiplier)+20}" x2="{(1500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <!--<line x1="{(1750*$xmultiplier)+20}" x2="{(1750*$xmultiplier)+20}" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(2000*$xmultiplier)+20}" x2="{(2000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <!--<line x1="{(2250*$xmultiplier)+20}" x2="{(2250*$xmultiplier)+20}" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(2500*$xmultiplier)+20}" x2="{(2500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <!--<line x1="{(2750*$xmultiplier)+20}" x2="{(2750*$xmultiplier)+20}" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            <line x1="{(3000*$xmultiplier)+20}" x2="{(3000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(3500*$xmultiplier)+20}" x2="{(3500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(4000*$xmultiplier)+20}" x2="{(4000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(4500*$xmultiplier)+20}" x2="{(4500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(5000*$xmultiplier)+20}" x2="{(5000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(5500*$xmultiplier)+20}" x2="{(5500*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            <line x1="{(6000*$xmultiplier)+20}" x2="{(6000*$xmultiplier)+20}" y1="0" y2="{($lettercount * $interval)}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
                            
                            <!--<line x1="120" x2="120" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>
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
                            <line x1="1020" x2="1020" y1="0" y2="{(59 * $interval) -1620}" stroke="black" stroke-width=".25" stroke-dasharray="8"/>-->
                            
                            
                            <!-- Instead stead of using xsl:apply-templates and creating another xsl:template match, we use xsl:for-each -->
                            <xsl:for-each select="$input">
                                <!-- Local variables -->
                                <xsl:variable name="ypos" select="(position() * $interval)-150"/>
                                <xsl:variable name="xpos" select="(count(descendant::emotion[@mood]) *20 )+20"/>
                                
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
                                <xsl:variable name="positive" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'happy'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeful']))) *$xmultiplier2 +20 +string-length(normalize-space(string-join(descendant::emotion[@mood = 'triumphant'])))*$xmultiplier2 +20 +string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant'])))*$xmultiplier2 +20 "/>
                                <xsl:variable name="negative" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'sad'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'afraid'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'disgusted'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeless'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'defeated'])))*$xmultiplier2 +20 + string-length(normalize-space(string-join(descendant::emotion[@mood = 'yielding'])))*$xmultiplier2 +20 "/>
                                <xsl:variable name="neutral" select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'bittersweet'])))*$xmultiplier2+20"/>
                                <!--bars-->
                                
                                <!--<line x1="20" x2="{$happy}" y1="{$ypos}" y2="{$ypos}" stroke="yellow" stroke-width="15"/>
                                <text x="{$happy + 10}" y="{$ypos+5}">
                                    Happy: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'happy'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$sad}" y1="{$ypos+15}" y2="{$ypos+15}" stroke="blue" stroke-width="15"/>
                                <text x="{$sad + 10}" y="{$ypos + 20}">
                                    Sad: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'sad'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$angry}" y1="{$ypos+30}" y2="{$ypos+30}" stroke="red" stroke-width="15"/>
                                <text x="{$angry + 10}" y="{$ypos+ 35}">
                                    Angry: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$bittersweet}" y1="{$ypos+45}" y2="{$ypos+45}" stroke="orange" stroke-width="15"/>
                                <text x="{$bittersweet + 10}" y="{$ypos + 50}">
                                    Bittersweet: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'bittersweet'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$hopeful}" y1="{$ypos+60}" y2="{$ypos+60}" stroke="green" stroke-width="15"/>
                                <text x="{$hopeful + 10}" y="{$ypos + 65}">
                                    Hopeful: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeful'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$afraid}" y1="{$ypos+75}" y2="{$ypos+75}" stroke="cyan" stroke-width="15"/>
                                <text x="{$afraid + 10}" y="{$ypos + 80}">
                                    Afraid: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'afraid'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$disgusted}" y1="{$ypos+90}" y2="{$ypos+90}" stroke="violet" stroke-width="15"/>
                                <text x="{$disgusted + 10}" y="{$ypos + 95}">
                                    Disgusted: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'disgusted'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$hopeless}" y1="{$ypos+105}" y2="{$ypos+105}" stroke="navy" stroke-width="15"/>
                                <text x="{$hopeless + 10}" y="{$ypos + 110}">
                                    Hopeless: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeless'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$triumphant}" y1="{$ypos+120}" y2="{$ypos+120}" stroke="Aqua" stroke-width="15"/>
                                <text x="{$triumphant + 10}" y="{$ypos + 125}">
                                    Triumphant: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'triumphant'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$defiant}" y1="{$ypos+135}" y2="{$ypos+135}" stroke="Coral" stroke-width="15"/>
                                <text x="{$defiant + 10}" y="{$ypos + 140}">
                                    Defiant: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$defeated}" y1="{$ypos+150}" y2="{$ypos+150}" stroke="DarkOrchid" stroke-width="15"/>
                                <text x="{$defeated + 10}" y="{$ypos + 155}">
                                    Defeated: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defeated'])))"/>
                                </text>
                                
                                <line x1="20" x2="{$yielding}" y1="{$ypos+165}" y2="{$ypos+165}" stroke="FloralWhite" stroke-width="15"/>
                                <text x="{$yielding + 10}" y="{$ypos + 170}">
                                    Yielding: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant'])))"/>
                                </text>-->
                                
                                <line x1="20" x2="{$positive -58.5714}" y1="{$ypos+65}" y2="{$ypos+65}" stroke="FloralWhite" stroke-width="15"/>
                                <text x="{$positive -48.5714 }" y="{$ypos + 70}">
                                    Positive: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'happy'])))+string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeful'])))+string-length(normalize-space(string-join(descendant::emotion[@mood = 'triumphant']))) +string-length(normalize-space(string-join(descendant::emotion[@mood = 'defiant']))) "/>
                                </text>
                                
                                <line x1="20" x2="{$negative -120}" y1="{$ypos+80}" y2="{$ypos+80}" stroke="red" stroke-width="15"/>
                                <text x="{$negative -110}" y="{$ypos + 85}">
                                    Negative: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'sad']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'angry']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'afraid']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'disgusted']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'hopeless']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'defeated']))) + string-length(normalize-space(string-join(descendant::emotion[@mood = 'yielding']))) "/>
                                </text>
                                
                                    <line x1="20" x2="{$neutral}" y1="{$ypos+95}" y2="{$ypos+95}" stroke="blue" stroke-width="15"/>
                                    <text x="{$neutral + 10}" y="{$ypos + 100}">
                                        Neutral: <xsl:value-of select="string-length(normalize-space(string-join(descendant::emotion[@mood = 'bittersweet'])))"/>
                                    </text>
                                <!-- labels each bar with its count -->
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                <!--y-axis label -->
                                <text x="15" y="{$ypos+85}" text-anchor="end"><xsl:apply-templates select="//(letter//pers[@role='sender'])[1]"/>-<xsl:apply-templates select = "date"/></text>
                                
                            </xsl:for-each>
                        </g>
                    </svg>
                    
                    
                    <!--<footer>
                        <br/>
                        <p><a href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="/state_of_the_union/pics/propercclicense.png" alt="state_of_the_union/pics/cclicense.png"></img></a></p>
                        <p><a href="https://github.com/finn-caskey/state_of_the_union">SOTU Team Github Here</a></p>
                        <br/>
                        <br/>
                    </footer>-->
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>