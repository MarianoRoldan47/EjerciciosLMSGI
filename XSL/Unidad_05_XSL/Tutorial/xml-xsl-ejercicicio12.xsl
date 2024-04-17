<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Superheroes</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <h1>Superhéroes de Marvel</h1>
        <xsl:for-each select="superheroe">
          <xsl:call-template name="tablaSuperheroe">
            <xsl:with-param name="numeroFila" select="position()"/>
            <xsl:with-param name="color" select="@color"/>
            <xsl:with-param name="imagen" select="@imagen"/>
          </xsl:call-template>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="tablaSuperheroe">
    <xsl:param name="numeroFila"/>
    <xsl:param name="color"/>
    <xsl:param name="imagen"/>
    <table border="1">
      <tr>
        <td style="background: {$color}" >Esto es una tabla con posicion: <xsl:value-of select="$numeroFila"/></td>
        <td><img width="300px">
            <xsl:attribute name="src"><xsl:value-of select="$imagen"/></xsl:attribute>
        </img></td>
      </tr>
    </table>
  </xsl:template>

 



  <xsl:template name="css">
    <style type="text/css">
      body {
      margin: 50px;
      padding: 0px;
      background: #2372DE;
      font-family: 'Open Sans', sans-serif;
      font-size: 11pt;
      color: #FFFFFF;
      text-align:center;
      }    
      
      img {
      width: 50px;	
      }
      
      .tituloTabla {
      text-align:center;
      padding:15px;
      background-color:#330099;
      font-weight:bold;
      }
      
    </style>
  </xsl:template>

</xsl:stylesheet>
