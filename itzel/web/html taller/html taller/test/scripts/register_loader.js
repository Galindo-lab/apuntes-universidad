
// selecciona el div 'lista-registros'
const target = document.getElementById("lista-registros");

// y al cargar la pagina agrega los registros en el div target  
window.onload = () => {
    for(element in registers) {
        // Aqui se puede agregar mas datos para los registros
        href = registers[element]["href"]
        author = registers[element]["author"]
        year = registers[element]["year"]
        test = registers[element]["test"]

    target.innerHTML += `
      <section class="book">
        <a href='${href}'>${element}</a>
        <br/>
        <sub>${author}, ${year}</sub>
      </section>
    `
    }
}
