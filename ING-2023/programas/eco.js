// Este codigo ha sido generado por el modulo psexport 20180802-l64 de PSeInt.
// Es posible que el codigo generado no sea completamente correcto. Si encuentra
// errores por favor reportelos en el foro (http://pseint.sourceforge.net).

// Valor Futuro Neto
// @param presente valor del dinero en el presente 
// @param interes valor del interes porcentual 
// @param numero de periodos
function nfv(presente, interes, periodos) {
	var subtotal = new Number();
	subtotal = presente*Math.pow((1+interes),periodos);
	return subtotal;
}

// Valor presente neto
// @param valor de un futuro
// @param interes valor del interes porcentual
// @prarm numero de periodos
function npv(futuro, interes, periodos) {
	// presente dado un futuro
	var subtotal = new Number();
	subtotal = futuro/Math.pow((1+interes),periodos);
	return subtotal;
}

function flujonv(flujo, nperiodos, interes, periododeinteres) {
	var i = new Number();
	var periododeinteresrelativo = new Number();
	var total = new Number();
	var valorequivalente = new Number();
	total = flujo[periododeinteres];
	for (i=0;i<=nperiodos;i++) {
		valorequivalente = 0;
		if (i<periododeinteres) {
			valorequivalente = nfv(flujo[i],interes,periododeinteres-i);
		}
		if (i>periododeinteres) {
			valorequivalente = npv(flujo[i],interes,i-periododeinteres);
		}
		total = total+valorequivalente;
	}
	return total;
}

function calculadoradeequivalencia() {
	var flujo = new Number();
	var capturav = new Number();
	var nflujos = new Number();
	var i = new Number();
	var interes = new Number();
	var periododeinteres = new Number();
	var periodoinicio = new Number();
	var periodofinal = new Number();
	var flujo = new Array(100);
	document.write("periodo de inicio:",'<BR/>');
	periodoinicio = Number(prompt());
	document.write("periodo final:",'<BR/>');
	periodofinal = Number(prompt());
	document.write("periodo de interes: ",'<BR/>');
	periododeinteres = Number(prompt());
	document.write("Interes",'<BR/>');
	interes = Number(prompt());
	nflujos = Math.abs(periodoinicio-periodofinal);
	for (i=0;i<=nflujos;i++) {
		document.write("Periodo ",periodoinicio+i,":",'<BR/>');
		flujo[i] = Number(prompt());
	}
	document.write("el valor de los fujos de dinero en el periodo ",periododeinteres," equivalen a:",'<BR/>');
	document.write(flujonv(flujo,nflujos,interes/100,Math.abs(periodoinicio-periododeinteres)),'<BR/>');
}

