<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>mondial</title>
            </head>
            <body>
                <xsl:element name="mondial">
                    <xsl:for-each select="//continent">
                        <xsl:variable name="continent">
                            <xsl:value-of select="@id"/>
                        </xsl:variable>
                        <xsl:element name="{$continent}">
                          
                            <xsl:attribute name="superficie" select="sum(/*/country/(@area * encompassed[@continent=$continent]/( @percentage  div 100 ) ))"/>
                                
                            
                            <xsl:for-each select="/*/country[encompassed/@continent=$continent]">
                                <xsl:variable name="pays_code">
                                    <xsl:value-of select="@car_code"/>
                                </xsl:variable>
                                <xsl:element name="pays">
                                    <xsl:attribute name="name" select="name" ></xsl:attribute>
                                    <xsl:attribute name="code" select="@car_code" ></xsl:attribute>
                                    <xsl:attribute name="population" select="population[last()]" ></xsl:attribute>
                                    <xsl:for-each select="descendant::city">
                                        <xsl:element name="city">
                                            
                                            <xsl:attribute name="name" select="name"></xsl:attribute>
                                            
                                        </xsl:element>
                                    </xsl:for-each>
                                    <xsl:for-each select="/*/airport[@country=$pays_code]">
                                        <xsl:element name="airports">
                                            
                                            <xsl:attribute name="name" select="name"></xsl:attribute>
                                            
                                        </xsl:element>
                                    </xsl:for-each>
                                    
                                </xsl:element>
                                
                            </xsl:for-each>
                        </xsl:element>
                        
                    </xsl:for-each>
                </xsl:element>
                
            </body>
        </html>
       
        
    </xsl:template>
</xsl:stylesheet>