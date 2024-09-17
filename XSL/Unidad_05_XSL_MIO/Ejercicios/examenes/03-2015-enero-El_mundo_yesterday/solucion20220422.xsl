<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/periodico">
        <html>
            <head>
                <title><xsl:value-of select="@nombre"/></title>
                
                <style type="text/css">
                    body {
                    font-family: Arial;
                    font-size: 12px;
                    }
                    
                    ol, ul
                    {
                    margin-top: 10px;
                    margin-left: 0px;
                    }
                    
                    #menu li
                    {
                    margin-left: 0px;
                    display: inline;
                    list-style-type: none;
                    padding: 10px 50px;
                    }
                    
                    .noticia {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: left; 
                    width: 338px;
                    }
                    
                    .noticia img {
                    width: 338px;
                    }
                    
                    .noticiaDobleAncho {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: left; 
                    width: 690px;
                    }
                    
                    .noticiaDobleAncho img {
                    width: 690px;
                    }
                    
                    .fechaNoticia {
                    color: #A3A34B;
                    }
                    
                    .comentariosNoticia {
                    color: #A3A34B;
                    padding-left: 20px;
                    }
                    
                    .divPublicidad {
                    /* border: #000 solid 1px; */
                    padding: 10px 5px;
                    float: right; 
                    width: 280px;                    
                    }
                    
                    .divPublicidad img {
                    width: 200px;
                    }
                </style>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    <div style="width: 1000px;"><img src="http://webdidacticarafaelmunoz.appspot.com/lmsgi/ejercicios-cap5/examen/2015-enero/recursos/el-mundo-yesterday.jpg" width="997" height="115" /></div>
                    <xsl:call-template name="menu"></xsl:call-template>
                    <div style="width: 700px; float: left;">
                        <xsl:apply-templates select="/periodico/noticias/noticia">
                            <xsl:with-param name="fechaNoticia"><xsl:value-of select="/periodico/noticias/noticia/@fecha"/></xsl:with-param>
                            <xsl:with-param name="comentarios"><xsl:value-of select="/periodico/noticias/noticia/@comentarios"/></xsl:with-param>
                        </xsl:apply-templates>
                    </div>
                    <div style="width: 295px; float: right;">
                        <xsl:apply-templates select="/periodico/publicidad/anuncio">
                            <xsl:sort select="@orden" order="ascending"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </body>
        </html>
        
        </xsl:template>
        
        <xsl:template name="menu">
            <div id="menu" style="width: 1000px; margin: 0px; padding: 0px;">
                  
            <ul>
                <xsl:for-each select="/periodico/menu/enlace">
                    <li>
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1"><xsl:attribute name="style">background:#DDE640;</xsl:attribute></xsl:when>
                            <xsl:otherwise><xsl:attribute name="style">background:orange;</xsl:attribute></xsl:otherwise>
                        </xsl:choose>
                        <a href="{@href}"><xsl:value-of select="."/></a></li> 
                </xsl:for-each>
                
            </ul>
                
            </div>
            
        </xsl:template>
    
        <xsl:template match="noticia">
            <xsl:param name="fechaNoticia"></xsl:param>
            <xsl:param name="comentarios"></xsl:param>
            <div>
                    <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="@dobleAncho = 's'">noticiaDobleAncho</xsl:when>
                        <xsl:otherwise>noticia</xsl:otherwise>
                    </xsl:choose>
                    </xsl:attribute>
                    
                    <h2><xsl:value-of select="titular"/></h2>
                    <h4><xsl:value-of select="subtitular"/></h4><img src="{@imagen}"/><br/><span class="fechaNoticia">
                        <xsl:value-of select="$fechaNoticia"/></span><span class="comentariosNoticia"><xsl:value-of select="$comentarios"/> comentarios
                        </span>
                </div>
        </xsl:template>
    
    <xsl:template match="anuncio">
           <div class="divPublicidad"><img width="280px" src="{@imagen}"/></div>     
    </xsl:template>
</xsl:stylesheet>
