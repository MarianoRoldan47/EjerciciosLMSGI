<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/superheroe">
    <html>
      <head>
        <title>Superheroes de Marvel</title>
      </head>
      <body>
      	<xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
   <xsl:template match="nombre">
      <h1>Superheroe: <xsl:value-of select="."/></h1>
  </xsl:template>

  <xsl:template match="poderes">
      <h1>Poderes: <xsl:value-of select="."/></h1>
  </xsl:template> 
  <xsl:template match="amigos">
      <h1>Amigos: <xsl:value-of select="."/></h1>
  </xsl:template>

</xsl:stylesheet>
