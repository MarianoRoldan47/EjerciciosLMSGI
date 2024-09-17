<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/alumno">
        <html>
            <head>
                <title>Alumno</title>
            </head>
            <body>
                <xsl:apply-templates select="nombre"/>
                <xsl:apply-templates select="direccion"/>
                <xsl:apply-templates select="telefono"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="nombre">
       <p>DNI: <xsl:value-of select="/alumno/@dni"/></p>
        <p>Nombre: <xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="direccion">
        <p>Calle: <xsl:value-of select="calle"/></p>
        <p>Numero: <xsl:value-of select="numero"/></p>
        <p>Ciudad: <xsl:value-of select="ciudad"/></p>
        <p>Provincia: <xsl:value-of select="provincia"/></p>
    </xsl:template>
    
    <xsl:template match="telefono">
        <p>Telefono: <xsl:value-of select="."/></p>
    </xsl:template>
    
    
</xsl:stylesheet>
