<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/partidoBaloncesto">
       <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
      <title></title>
      
      <xsl:call-template name="css"/>
       
   </head>
   <body>
      <div style="width: 1000px; margin: 0 auto;">
         <h1 align="center">Baloncesto: Baloncesto Lucena 2 - Unicaja Baloncesto</h1>
         <table border="1" width="100%">
            <tr>
               <th>Equipo</th>
               <th>Jugador</th>
               <th>Dorsal</th>
               <th>Apodo</th>
               <th>Puntos</th>
               <th>Rebotes</th>
               <th>Asistencias</th>
            </tr>
             <xsl:for-each select="equipo" >
                 <xsl:variable name="colorFila">
                    <xsl:choose>
                        <xsl:when test="@tipo = 'Local'">#d8e7ff</xsl:when>
                        <xsl:otherwise>#d8ffcc</xsl:otherwise>
                    </xsl:choose>
                 </xsl:variable>
                 
                 <xsl:apply-templates select="jugador" >
                     <xsl:with-param name="colorFila"><xsl:value-of select="$colorFila"/></xsl:with-param>
                     
                     <xsl:sort select="@nombre" order="ascending"/>
                 </xsl:apply-templates>
             </xsl:for-each>
         </table>
         <p></p>
         <p></p>
         <table width="100%" style="background: url('recursos/pista.jpg') no-repeat;" id="tablaCancha">
          
                 <xsl:call-template name="bucleForFila">
                     <xsl:with-param name="i">1</xsl:with-param>
                 </xsl:call-template>
         </table>
         <p></p>
         <p></p>
         <table align="center" border="1" width="50%">
            <tr>
               <th>Tiempo</th>
               <th>Jugador</th>
               <th>Apodo</th>
               <th>Descripcion</th>
               <th>Icono</th>
            </tr>
             <xsl:apply-templates select="/partidoBaloncesto/historico/entrada"></xsl:apply-templates>
         </table>
      </div>
   </body>
</html>
    </xsl:template>
    
    <xsl:template match="entrada">
        
        <tr>
            <td><xsl:value-of select="@tiempo"/></td>
            <td><xsl:value-of select="@jugador"/></td>
            <td><xsl:variable name="jugador"><xsl:value-of select="@jugador"/></xsl:variable>
                <xsl:value-of select="/partidoBaloncesto/equipo/jugador[@nombre = $jugador]/@apodo"/>
            </td>
            <td><xsl:value-of select="."/></td>
            <td><xsl:variable name="tipoEntrada"><xsl:value-of select="@tipo"/></xsl:variable>
                <img src="{../imagen[@tipo = $tipoEntrada]/.}"></img>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        
        <xsl:if test="$i &lt;= 5">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                    
                </xsl:call-template>
            </tr>
            
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;= 10">
            <xsl:call-template name="celda">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <td>
            <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
                <xsl:if test="@posicionX = $j and @posicionY = $i">
                    <img src="{../@imagen}"></img>
                    <xsl:value-of select="@nombre"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
   
    
    
    <xsl:template match="jugador">
        <xsl:param name="colorFila"></xsl:param>
            <tr>
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: <xsl:value-of select="$colorFila"/>;</xsl:attribute>
                </xsl:if>
                
                <td><img src="{../@imagen}"/></td>
                <td><xsl:value-of select="@nombre"/></td>
                <td><xsl:value-of select="@dorsal"/></td>
                <td><xsl:value-of select="@apodo"/></td>
                <td><xsl:value-of select="@puntos"/></td>
                <td><xsl:value-of select="@rebotes"/></td>
                <td><xsl:value-of select="@asistencias"/></td>
            </tr>
    </xsl:template>
    
    
    <xsl:template name="css">
        <style type="text/css">
            body {
            font-family: Arial;
            font-size: 11px;
            }
            
            table img {
            width: 40px;
            }
            
            th {
            background: #1e3356;
            color: #FFFFFF;
            }
            
            #tablaCancha {
            color: #eff4fc;
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
            width: 280px;                    }
            }
            
            .divPublicidad img {
            width: 200px;
            }
        </style>
    </xsl:template>
    
</xsl:stylesheet>
