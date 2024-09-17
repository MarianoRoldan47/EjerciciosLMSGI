<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Superheroes</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <h1>Superhéroes de Marvel</h1>
        <xsl:call-template name="bucleForClasico">
        	<xsl:with-param name="i">0</xsl:with-param>
        </xsl:call-template>
        
      </body>
    </html>
  </xsl:template>


  <xsl:template name="bucleForClasico">
  	<xsl:param name="i"/>
  	<xsl:if test="$i &lt; 10">
  		<p><xsl:value-of select="$i"/></p>
  		<xsl:call-template name="bucleForClasico">
  			<xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
  		</xsl:call-template>
  	</xsl:if>
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
      width: 200px;	
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
