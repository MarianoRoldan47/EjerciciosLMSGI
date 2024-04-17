<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/gormitis">
        <html>
            <head>
                <title>Gormitis</title>
                <style type="text/css">
                    img {
                        width: 60px;
                    }
                    
                    td {
                    width: 200px;
                    height: 150px;
                    }
                </style>
            </head>
            <body>
                <table border="1" width="50%" style="background: url('{/gormitis/tablero/@url}') no-repeat;">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">0</xsl:with-param>
                    </xsl:call-template>
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 2">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">0</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 2">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/gormitis/tablero/gormitiEnMapa">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:call-template name="imagenEnCelda">
                        <xsl:with-param name="tribu">
                            <xsl:value-of select="@tribu"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    <xsl:template name="imagenEnCelda">
        <xsl:param name="tribu" />
        
        <xsl:for-each select="/gormitis/gormiti">
            <xsl:if test="@tribu = $tribu">
                <img  src="{.}"></img>                
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>
