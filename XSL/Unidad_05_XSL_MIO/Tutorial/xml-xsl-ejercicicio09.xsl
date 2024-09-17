<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/marvel">
    <html>
      <head>
        <title>Superheroes</title>
      </head>
      <body>
        <!-- Total de nodos de tipo superheroe -->
        <p>Total de superheroes: <xsl:value-of select="count(superheroe)"/></p>
        
        <!-- Acceso a diferentes nodos de una colección (iguales y hermanos) a través de la posición que ocupan -->
        <p>Primer superheroe: <xsl:value-of select="superheroe[1]/@nombre"/></p>
        <p>Segundo superheroe: <xsl:value-of select="superheroe[2]/@nombre"/></p>
        <p>Tercer superheroe: <xsl:value-of select="superheroe[3]/@nombre"/></p>
        
        <!-- Conseguir la posición que ocupa cada nodo en una colección -->
        <xsl:for-each select="superheroe">
          <p>Superheroe: <xsl:value-of select="@nombre"/>, posición: <xsl:value-of select="position()"/></p>
        </xsl:for-each>
        
        <!-- Concatenación de cadenas de caracteres -->
        <p>Ejemplo de concatenación: <xsl:value-of select="concat('Vengador ', superheroe[1]/@nombre)"/></p>
        
        <!-- Función para comprobar si una cadena de texto se encuentra dentro de otra -->
        <xsl:for-each select="superheroe">
          <xsl:if test="contains(@nombre, 'ho')">
            <p>Ejemplo de contains: <xsl:value-of select="@nombre"/></p>
          </xsl:if>
        </xsl:for-each>
        
        <!-- Obtener la longitud de una cadena de caracteres -->
        <p>Ejemplo de string-length. Thor tiene <xsl:value-of select="string-length('Thor')"/> caracteres</p>
        
        <!-- Subcadena de una cadena de texto -->
        <p>Ejemplo de substring: <xsl:value-of select="substring('Una cadena de texto', 2, 8)"/></p>
        
        <!-- Ejemplo de operación combinada de suma, multiplicación y división entera -->
        <p>Ejemplo calculo matemático <xsl:value-of select="((4 + 8) div 2) * 2"/></p>
        
        <!-- Resto de una división entera -->
        <p>Ejemplo de funcíon módulo o resto de la división <xsl:value-of select="15 mod 4"/></p>
        
        <!-- Negación -->
        <xsl:if test="(not(false))">
          <p>Ejemplo de 'not'</p>
        </xsl:if>
        
        <!-- Comparación "distinto de" -->
        <xsl:if test="12 != 10">
          <p>Ejemplo de '!='</p>
        </xsl:if>
        
        <!-- Comparación "menor que" -->
        <xsl:if test="(5 &lt; 10)">
          <p>Ejemplo de '&lt;'</p>
        </xsl:if>
        
        <!-- Comparación "mayor que" -->
        <xsl:if test="10 > 5">
          <p>Ejemplo de '>'</p>
        </xsl:if>
        
        <!-- Comparación "menor o igual que" -->
        <xsl:if test="6 &lt;= 6">
          <p>Ejemplo de '&lt;='</p>
        </xsl:if>
        
        <!-- Comparación "mayor o igual que" -->
        <xsl:if test="6 >= 6">
          <p>Ejemplo de '>='</p>
        </xsl:if>
        
        <!-- Operador de disyunción or -->
        <xsl:if test="(1 > 2) or (2 > 1)">
          <p>Ejemplo de 'or'</p>
        </xsl:if>
        
        <!-- Operador and -->
        <xsl:if test="(1 >= 1) and (2 != 4)">
          <p>Ejemplo de 'and'</p>
        </xsl:if>
        
     </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
