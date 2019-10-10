<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/mondial">
        <html>
            <head>
                <title></title>
            </head>
            <body>
                <table style="width:100%;font-weight: bold" border="1" bgcolor="gray" >
                    <tr>
                        <th></th>
                        <th>Jewish</th>
                        <th>Muslim</th>
                        <th>Christian</th>
                        <th>Autres</th>
                    </tr>
                    <xsl:for-each select="continent">
                        <xsl:variable name="continent"><xsl:value-of select="@id"/></xsl:variable>
                    <tr>
                        <th><xsl:value-of select="$continent"/></th>
                        <td colspan="1">
                            <xsl:value-of select=" (sum(/*/country[encompassed/@continent=$continent]/population[last()])*sum(/*/country[encompassed/@continent=$continent]/religion[text()='Jewish']/@percentage)) div 100"/>
                           
                        </td>
                        <td colspan="1">
                            <xsl:value-of select=" (sum(/*/country[encompassed/@continent=$continent]/population[last()])*sum(/*/country[encompassed/@continent=$continent]/religion[text()='Muslim']/@percentage)) div 100"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select=" (sum(/*/country[encompassed/@continent=$continent]/population[last()])*sum(/*/country[encompassed/@continent=$continent]/religion[contains(text(),'Christian')]/@percentage)) div 100"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="(sum(/*/country[encompassed/@continent=$continent]/population[last()])*sum(/*/country[encompassed/@continent=$continent]/religion[not(contains(text(),'Christian')) and text()!='Muslim' and text()!='Jewish']/@percentage)) div 100"/>
                        </td>
                    </tr>
                    </xsl:for-each>
                    <tr>
                        <th>World</th>
                        <td colspan="1">
                            <xsl:value-of select="(sum(/*/country/religion[text()='Jewish']/@percentage)*sum(/*/country/population)) div 100"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="(sum(/*/country/religion[text()='Muslim']/@percentage)*sum(/*/country/population)) div 100"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="(sum(/*/country/religion[contains(text(),'Christian')]/@percentage)*sum(/*/country/population)) div 100"/>
                        </td>
                        <td colspan="1">
                            <xsl:value-of select="(sum(/*/country/religion[text()!='Jewish' and text()!='Muslim' and not(contains(text(),'Christian'))]/@percentage)*sum(/*/country/population)) div 100"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>
