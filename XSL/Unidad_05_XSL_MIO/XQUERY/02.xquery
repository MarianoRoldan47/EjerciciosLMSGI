<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>