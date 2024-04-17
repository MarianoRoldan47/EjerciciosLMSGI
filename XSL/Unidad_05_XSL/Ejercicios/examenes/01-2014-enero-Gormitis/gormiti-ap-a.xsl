<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/gormitis">
        <html>
            <head>
                <title>Gormitis</title>
                
                <style type="text/css">
                    th {
                        background: blue;
                        color: #FFFFFF;
                    }
                    img {
                        width: 50px;
                    }
                </style>
            </head>
            <body>
               <table style="width: 50%; align: center;">
                   <tr>
                       <th></th>
                      <th>Gormiti</th>
                       <th>Tribu</th>
                   </tr>
                   <xsl:for-each select="gormiti">
                       <tr>
                           <xsl:if test="position() mod 2 = 1">
                               <xsl:attribute name="style">background: lightblue;</xsl:attribute>
                           </xsl:if>
                           <td><xsl:value-of select="position()"/></td>
                           <td><img><xsl:attribute name="src"><xsl:value-of select="."/></xsl:attribute></img></td>
                           <td><xsl:value-of select="@tribu"/></td>
                       </tr>
                   </xsl:for-each>
               </table>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="gormiti">
               
    </xsl:template>
    
    
    
</xsl:stylesheet>
