<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/biblioteca">
        <html>
            <head>
                <title>Biblioteca</title>
            </head>
            <body>
                <xsl:apply-templates select="libro">
                    <xsl:sort select="." order="ascending"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="libro">
        <table border="1">
            <tr>
                <td><xsl:apply-templates select="titulo"/></td>
                <td><xsl:apply-templates select="fechaPublicacion"/></td>
            </tr>
            <xsl:apply-templates select="autor"/>
            
           
        </table>
    </xsl:template>
    
    <xsl:template match="titulo">
       <xsl:value-of select="."/>
    </xsl:template> 
    <xsl:template match="fechaPublicacion">
       <xsl:value-of select="@año"/>
    </xsl:template>
    
    <xsl:template match="autor">
        <tr>
            <td><xsl:value-of select="."/></td>
            <td><xsl:value-of select="@fechaNacimiento"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
