<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/cine">
       <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
      <title><xsl:value-of select="@nombre"/></title>
       <style type="text/css">
           td {
           text-align:center;
           }
           body {
           font-family: Arial;
           font-size: 12px;
           }
       </style>
       
   </head>
   <body>
       <div style="width: 1000px; margin: 0 auto;">
           <h1><xsl:value-of select="@nombre"/></h1><img src="{titulo/imagen/.}" width="500px" /><h2><xsl:value-of select="titulo/@nombre"/></h2>
               <h3>
                   Estreno: <xsl:value-of select="titulo/@estreno"/>
               </h3>
               <p></p>
               <table border="1" width="100%">
                   <xsl:apply-templates select="/cine/sesiones/sesion"></xsl:apply-templates>
               </table>
       </div>
       
       <xsl:apply-templates select="cartelera" />
   </body>
</html>
    </xsl:template>
    
    <xsl:template match="sesion">
        <tr>
            
            <td align="center">
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background:#dbf7ff;</xsl:attribute>
                </xsl:if>
                Sesión: <xsl:value-of select="position()"/>
                - Hora: <xsl:value-of select="@hora"/>
                <table border="1" width="50%" align="center">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
            </td> 
        </tr>
    </xsl:template>
    
    <xsl:template match="cartelera">
        <table border="1">
            <tr>
                <xsl:for-each select="pelicula">
                    <td>
                        <h3><xsl:value-of select="@nombre"/></h3>
                        <xsl:variable name="idPelicula"><xsl:value-of select="@id"/></xsl:variable>
                        <img src="{/cine/imagenes/imagen[@id = $idPelicula]}"></img>
                        
                    </td>
                </xsl:for-each>
                
            </tr>
        </table>
        
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        
        <xsl:if test="$i &lt;= 4">
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
        <xsl:if test="$j &lt;= 4">
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
            <xsl:choose>
                <xsl:when test="ocupado[$j = @asiento and  $i = @fila]">
                    <img src="{/cine/imagenes/imagen[@id= 'ocupado']}"></img>
                </xsl:when>
                <xsl:otherwise><img src="{/cine/imagenes/imagen[@id= 'libre']}"></img></xsl:otherwise>
            </xsl:choose>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
