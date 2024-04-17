<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>primerDia1DAW</title>
                <style>
                    td {
                    width: 100px;
                    height: 100px;
                    text-align: center;
                    }
                    
                    img {
                    width: 100px;
                    height: 100px;
                    }
                </style>
            </head>
            <body>
                <table style="width: 50%; align: center;" border="1">
                    
                    <xsl:for-each select="estructuraAula">
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
        <xsl:if test="$i &lt;= 11">
                <tr>
                    <xsl:call-template name="bucleForColumna">
                        <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                        <xsl:with-param name="j">1</xsl:with-param>
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
        <xsl:if test="$j &lt;= 8">
            <xsl:call-template name="celda">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <td>
            <xsl:for-each select="bloque">
                <xsl:variable name="tipoBloque" select="@tipo"/>
                <xsl:if test="@x = $j and @y = $i">
                    <xsl:attribute name="style">background: #<xsl:value-of select="/primerDia1DAW/estructuraAula/color[@tipo = $tipoBloque]"/>;</xsl:attribute>
                <xsl:value-of select="@tipo"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="/primerDia1DAW/alumnado/alumno">
                <xsl:variable name="sexoAlumno" select="@sexo"/>
                <xsl:if test="@x = $j and @y = $i">
                    <xsl:attribute name="style">
                    <xsl:choose>
                        <xsl:when test="@sexo = 'H'">
                            background: #e5b8b7;
                        </xsl:when>
                        <xsl:otherwise>
                           background: #daeef3;
                        </xsl:otherwise>
                 
                    </xsl:choose>
                    </xsl:attribute>
                    
                    <img src="{/primerDia1DAW/alumnado/imagen[@sexo = $sexoAlumno]}"></img>
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    
</xsl:stylesheet>

