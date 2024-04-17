<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>Tanques</title>
                
                <style type="text/css">
                    th {
                    background: blue;
                    color: white;
                    font-size: bold;
                    }
                    
                    img {
                    width: 50px;
                    }
                </style>
            </head>
            <body>
               <table style="width: 50%; align: center;" border="1">
                   <tr>
                       <th>Jugada</th>
                      <th colspan="2">Tanque</th>
                       <th>Descripcion</th>
                   </tr>
                   <xsl:for-each select="jugadasDescritas/jugada">
                       <tr>
                           <xsl:if test="position() mod 2 = 1">
                               <xsl:attribute name="style">background: lightblue;</xsl:attribute>
                           </xsl:if>
                           <td><xsl:value-of select="position()"/></td>
                           <td><xsl:value-of select="@jugador"/></td>
                           <td>
                               <xsl:variable name="jugadorTanque"><xsl:value-of select="@jugador"/></xsl:variable>
                               <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
                                   <xsl:if test="@jugador = $jugadorTanque">
                                       <img src="{.}"/>
                                   </xsl:if>
                               </xsl:for-each>
                           </td>
                           <td><xsl:value-of select="@desc"/></td>
                       </tr>
                   </xsl:for-each>
               </table>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="imagenTanque">
        <xsl:param name="jugador"></xsl:param>
               <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
                   <xsl:if test="@jugador = $jugador">
                       <img src="{.}"/>
                   </xsl:if>
               </xsl:for-each>
    </xsl:template>
    
    
    
</xsl:stylesheet>
