<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/ligaVoleibol">
    <html>
      <head>
        <title><xsl:value-of select="@nombreLiga"/> de <xsl:value-of select="@pais"/></title>
      
          <style type="text/css">
            td {
            text-align:center;
            }
            body {
            font-family: Arial;
            font-size: 12px;
            text-align: center;
            margin: 0 auto;
            }
            table {
            
            width: 50%;
            align: center;
            }
            
            img {
            width: 40px;
            }
            
            #table2 img {
            width: 20px;
            }
            
            #table2 td {
            width:85px;
            height:60px;
            }
            
            #table2 {
              background-size: cover;
            }
            
            th {
            background: blue;
            color: white;
            }
          </style>
      </head>
      <body>
        <h1><xsl:value-of select="@nombreLiga"/> de <xsl:value-of select="@pais"/></h1>
        <h2>Clasificacion</h2>
        
        <table width="70%" align="center" border="1">
          <tr>
            <th>Imagen</th>
            <th>Nombre equipo</th>
            <th>Puntos</th>
            <th>Partidos Jugados</th>
            <th>Ganados</th>
            <th>Perdidos</th>
            <th>Ganados menos perdidos</th>
          </tr>
          
          <xsl:apply-templates select="clasificacion"/>
         
        </table>
        
        <xsl:call-template name="equipoMasPuntos">
          
        </xsl:call-template>
        
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        
        <xsl:apply-templates select="mapa"/>
        
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        
        
        
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="mapa">
    <table id="table2" align="center" border="1" style="background-image: url('{@imagen}');">
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i">1</xsl:with-param>
      </xsl:call-template>
    </table> 
  </xsl:template>
  
  
  
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 10">
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
    <xsl:if test="$j &lt;= 10">
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
    <td align="center">
      <xsl:for-each select="equipo">
            <xsl:if test="$x = CoordenadaX/@valor and $y = coordenadaY/@valor">
              <xsl:variable name="idImg"><xsl:value-of select="@id"/></xsl:variable>
              <xsl:choose>
                <xsl:when test="$x mod 2 = 1"><xsl:attribute name="style">background: pink;</xsl:attribute></xsl:when>
                <xsl:otherwise><xsl:attribute name="style">background: tomato;</xsl:attribute></xsl:otherwise>
                  
              </xsl:choose>
              <img src="{/ligaVoleibol/recursos/imagenes/img[@id = $idImg]/url/.}"/>
            <br></br>
              <xsl:value-of select="/ligaVoleibol/clasificacion/equipo[@id = $idImg]/nombre/."/>
            
            </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>

  <!-- -->
  <xsl:template match="clasificacion">
    <xsl:variable name="color">1</xsl:variable>
    <xsl:for-each select="equipo">
      
      <xsl:variable name="idImg"><xsl:value-of select="@id"/></xsl:variable>
      
      <xsl:sort order="ascending" select="nombre/." />
      <tr>
        <xsl:call-template name="colorFila">
          <xsl:with-param name="posicion"><xsl:value-of select="position()"/></xsl:with-param>
        </xsl:call-template>
        <td><img src="{/ligaVoleibol/recursos/imagenes/img[@id = $idImg]/url/.}"></img></td>
        <td><xsl:value-of select="nombre/."/></td>
        <td><xsl:value-of select="@puntos"/></td>
        <td><xsl:value-of select="@Jugados"/></td>
        <td><xsl:value-of select="@ganados"/></td>
        <td><xsl:value-of select="@perdidos"/></td>
        <td><xsl:value-of select="@ganados - @perdidos"/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="colorFila">
    <xsl:param name="posicion"></xsl:param>
    <xsl:choose>
      <xsl:when test="$posicion mod 3 = 0"><xsl:attribute name="style">background: white;</xsl:attribute></xsl:when>
      <xsl:when test="$posicion mod 3 = 1"><xsl:attribute name="style">background: lightblue;</xsl:attribute></xsl:when>
      <xsl:otherwise><xsl:attribute name="style">background: lightyellow;</xsl:attribute></xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="equipoMasPuntos">
    <h1> Equipo con más puntos: </h1>
    <xsl:for-each select="clasificacion/equipo">
      <xsl:sort order="descending" select="@puntos"/>
      <xsl:if test="position() = 1">
        <xsl:variable name="idImg"><xsl:value-of select="@id"/></xsl:variable>
        <h2><img src="{/ligaVoleibol/recursos/imagenes/img[@id = $idImg]/url/.}"></img>
        <xsl:value-of select="nombre/."/> - <xsl:value-of select="@puntos"/></h2>
        
      </xsl:if>
      
    </xsl:for-each>
    
    
  </xsl:template>
  
</xsl:stylesheet>





