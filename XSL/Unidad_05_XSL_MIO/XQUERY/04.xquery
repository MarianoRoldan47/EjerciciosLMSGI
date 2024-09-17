<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains(upper-case($superheroe/@poderes), 'FUERZA') and contains(lower-case($superheroe/@amigos), 'iron man')
return <superheroe>{ data($superheroe/@nombre) }</superheroe>
} </marvel>