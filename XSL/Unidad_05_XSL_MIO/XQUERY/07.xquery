<html>
      <head>
        <title>Marvel</title>
      </head>
      <body>
        
    { 
        for $superheroe in doc('superheroes.xml')/marvel/superheroe
        return 
        <table border="1" >
            <tr style="background-color: blue; color: white;">
                <th>Nombre</th>
                <th>Poderes</th>
                <th>Amigos</th>
                <th>Nivel</th>
            </tr>
            <tr>
                <td>{ data($superheroe/@nombre) }</td>
                <td>{ data($superheroe/@poderes) }</td>
                <td>{ data($superheroe/@amigos) }</td>
                <td>{ data($superheroe/@nivel) }</td>
            </tr>
        </table>		
    }
      </body>
    </html>