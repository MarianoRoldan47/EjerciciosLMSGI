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
        <xsl:for-each select="superheroe">
          <table border="1">
            <xsl:choose>
              <xsl:when test="(position() mod 2) = 1">
                <tr>
                  <td style="background: #00FF00;"><xsl:value-of select="concat(@nombre, ' ', @poderes)"/></td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr>
                  <td><xsl:value-of select="concat(@nombre, ' ', @poderes)"/></td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </table>
          <br/>
        </xsl:for-each>
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
