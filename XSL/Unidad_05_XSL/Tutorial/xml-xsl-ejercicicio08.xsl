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
        <table border="1">
          <tr class="tituloTabla">
            <td>Thor</td>
          </tr>
          <tr>
            <td>poderes: <xsl:value-of select="superheroe[@nombre='Thor']/@poderes"/></td>
          </tr>
          <tr>
            <td>amigos: <xsl:value-of select="superheroe[@nombre='Thor']/@amigos"/></td>
          </tr>
        </table>
      </body>
    </html>
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
      
      .tituloTabla {
      font-weight: bold;   
      text-align: center;
      }
    </style>
  </xsl:template>

</xsl:stylesheet>
