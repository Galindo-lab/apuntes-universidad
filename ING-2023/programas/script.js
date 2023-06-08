function generarEntradas() {
    const min = parseInt(document.getElementById("minimo").value);
    const max = parseInt(document.getElementById("maximo").value);
    const entradas = document.getElementById("entradas");

    // Limpiar las entradas existentes
    entradas.innerHTML = "";

    // Generar las nuevas entradas
    for (let i = min; i <= max; i++) {
        const nuevaEntrada = `
        <label for="entrada${i}">${i}:</label>
        <input type="text" id="entrada${i}" name="entrada${i}">
        </br>
    `;
        entradas.insertAdjacentHTML("beforeend", nuevaEntrada);
    }
}


function obtenerValores() {
    var entradas = Array.from(document.querySelectorAll("#entradas input"));
    return entradas.map(entrada => parseFloat(entrada.value) || 0);
}

function limpiarFormulario() {
    var minimo = document.getElementById("minimo");
    var maximo = document.getElementById("maximo");
    var periodo = document.getElementById("periodo");
    var interes = document.getElementById("interes");
    var resultado = document.getElementById("resultado");

    // Limpiar las entradas existentes
    entradas.innerHTML = "";

    // Vaciar los campos de rango mínimo y máximo
    minimo.value = "";
    maximo.value = "";
    periodo.value = "";
    interes.value = "";
    resultado.value = "";
}
