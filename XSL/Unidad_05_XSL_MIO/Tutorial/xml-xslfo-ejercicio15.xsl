<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:output method="xml" encoding="iso-8859-1" indent="yes"/>
    
    <xsl:template match="/marvel">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin-top="1cm" margin-bottom="1cm" margin-left="1cm" margin-right="1cm">
                    <fo:region-body margin="1cm"/>
                    <fo:region-before extent="1cm"/>
                    <fo:region-after extent="1cm"/>
                    <fo:region-start extent="1cm"/>
                    <fo:region-end extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:title>Don Quijote de la Mancha</fo:title>
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-family="Arial" font-size="9pt" text-align="right" text-decoration="underline">Marvel - Superhéroes</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-family="Arial" font-size="9pt" text-align="center" text-decoration="underline">Ediciones Rafa Muñoz</fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block-container reference-orientation="90">
                        <fo:block font-family="Arial" font-size="9pt" text-align="center">Margen izquierdo</fo:block>
                    </fo:block-container>            
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-end">
                    <fo:block-container reference-orientation="270">
                        <fo:block font-family="Arial" font-size="9pt" text-align="center">Margen derecho</fo:block>
                    </fo:block-container>            
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    
                    <fo:block-container font-family="Arial" font-size="10pt" line-height="1.5" text-align="justify" text-indent="1cm" id="Referencia-interna">
                        <xsl:for-each select="superheroe">
                            <fo:block >
                                <fo:inline color="blue" font-size="16pt" font-weight="bold"><xsl:value-of select="@nombre"/></fo:inline>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block-container>            
                    
                </fo:flow>
            </fo:page-sequence>
        </fo:root>        
    </xsl:template>
    
</xsl:stylesheet>