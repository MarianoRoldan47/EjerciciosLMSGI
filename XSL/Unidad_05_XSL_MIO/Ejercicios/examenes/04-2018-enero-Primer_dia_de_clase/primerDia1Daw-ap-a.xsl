<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>primerDia1DAW</title>
                <style>
                    th {
                    background: lightblue;
                    align: center;
                    }
                </style>
            </head>
            <body>
               <table style="width: 50%; align: center;" border="1">
                   <tr>
                       <th></th>
                       <th>1</th>
                       <th>2</th>
                       <th>3</th>
                       <th>4</th>
                       <th>5</th>
                       <th>6</th>
                      
                   </tr>
                   <xsl:for-each select="horario">
                       <xsl:call-template name="bucleForFila">
                           <xsl:with-param name="i">1</xsl:with-param>
                       </xsl:call-template>
                   </xsl:for-each>
               </table>
                
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 5">
            
            <xsl:for-each select="dia">
                <xsl:if test="$i = position()">
                    <tr>
                        <th><xsl:value-of select="@desc"/></th>
                        <xsl:call-template name="bucleForColumna">
                            <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                            <xsl:with-param name="j">1</xsl:with-param>
                        </xsl:call-template>
                    </tr> 
                </xsl:if>
                
            </xsl:for-each>
            
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 6">
            <xsl:call-template name="celda">
                <xsl:with-param name="orden"><xsl:value-of select="$j"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="orden"/>
        <td>
            <xsl:for-each select="hora">
                <xsl:if test="@orden = $orden">
                    <xsl:choose>
                        <xsl:when test="@orden mod 2 = 1">
                            <xsl:attribute name="style">background: orange;</xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:value-of select="."/>
                    
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    
</xsl:stylesheet>
