
// Valor Futuro Neto
// @param presente valor del dinero en el presente 
// @param interes valor del interes porcentual 
// @param numero de periodos
SubProceso subtotal <- NFV ( presente, interes, periodos )
	definir subtotal como real;
	subtotal <- presente * (1+interes)^periodos;
FinSubProceso

// Valor presente neto
// @param valor de un futuro
// @param interes valor del interes porcentual
// @prarm numero de periodos
SubProceso subtotal <- NPV (futuro, interes, periodos)
	// presente dado un futuro
	definir subtotal como real;
	subtotal <- futuro / (1+interes)^periodos;
FinSubProceso


SubProceso total <- flujoNV (flujo, nPeriodos, interes, periodoDeInteres)
	Definir i, periodoDeInteresRelativo Como Entero;
	Definir total, valorEquivalente como real;
	
	total <- flujo[periodoDeInteres];
	
	Para i <- 0 Hasta nPeriodos Con Paso 1 Hacer
		valorEquivalente <- 0;
		
		Si i < periodoDeInteres Entonces
			valorEquivalente <- NFV(flujo[i], interes, periodoDeInteres - i);
		FinSi
		
		Si i > periodoDeInteres Entonces
			valorEquivalente <- NPV(flujo[i], interes, i - periodoDeInteres);
		FinSi
		
		total <- total + valorEquivalente;
	FinPara
FinSubProceso




Proceso CalculadoraDeEquivalencia
	definir flujo,capturaV como real;
	definir nFlujos, i, interes, periodoDeInteres,  periodoInicio, periodoFinal como entero;
	
	Dimension flujo[100];
	
	Escribir  "periodo de inicio:";
	leer periodoInicio;
	
	Escribir "periodo final:";
	leer periodoFinal;
	
	Escribir "periodo de interes: ";
	leer periodoDeInteres;
	
	Escribir "Interes";
	leer interes;
	
	nFlujos <- abs(periodoInicio - periodoFinal);
	
	
	Para i <- 0 Hasta nFlujos Con Paso 1 Hacer
		Escribir "Periodo ", periodoInicio + i, ":";
		Leer flujo[i];
	FinPara
	
	escribir "el valor de los fujos de dinero en el periodo ", periodoDeInteres, " equivalen a:";
	
	Escribir flujoNV(flujo, nFlujos, interes/100, abs(periodoInicio - periodoDeInteres) );
	
	
FinProceso
