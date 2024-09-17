<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Superheroes</title>

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
        
        .tituloTabla {
          font-weight: bold;   
          text-align: center;
        }
      </style>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="superheroe">
    <table border="1">
      <tr class="tituloTabla">
        <td><xsl:value-of select="nombre"/></td>
      </tr>
      <tr>
        <td>poderes: <xsl:value-of select="poderes"/></td>
      </tr>
      <tr>
        <td>amigos: <xsl:value-of select="amigos"/></td>
      </tr>
    </table>
    <br/>
  </xsl:template>



</xsl:stylesheet>
