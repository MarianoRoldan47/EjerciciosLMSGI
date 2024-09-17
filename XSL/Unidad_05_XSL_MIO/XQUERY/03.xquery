<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza') and contains($superheroe/@amigos, 'Iron Man')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>