# Los efectos de no valorar la calidad del software

¿Dirías que Amazon o la NASA tienen errores de software en sus proyectos? Estas y otras grandes compañías han tenido graves problemas por descuidar su…

5 minutos de lectura

Ver original

---

A medida que avanzan las tecnologías son más los aparatos digitalizados que nos rodean. Aviones, coches, edificios, semáforos, electrodomésticos, relojes... tienen partes controladas por procesadores gracias al gran avance en IT.

En un coche, por ejemplo, puede haber hasta unos 70 procesadores controlando individualmente tareas como los frenos ABS, airbags, control de crucero o el suministro de combustible.

Es por ello que **cada vez son más los productos que deben ser testados**, ya que sacar al mercado un producto que no ha pasado un buen proceso de calidad puede traer **graves consecuencias tanto económicas como personales**.

Habitualmente se habla de **calidad del código**, [pipelines de integración contínua](https://www.paradigmadigital.com/dev/pipelines-de-jenkins-evolucion-continuous-delivery/), automatización de pruebas y de la influencia que tienen estos y otros elementos en los casos de éxito de nuestros productos.

Sin embargo, es menos frecuente hablar de casos en los que no todo salió como se deseaba. Por eso, a continuación, veremos algunos ejemplos muy conocidos y otros que no lo han sido tanto.

## Phobos 1 y la falta de tiempo

Formó parte del proyecto [Phobos](https://es.wikipedia.org/wiki/Programa_Fobos) de la Unión Soviética para el estudio del planeta Marte. Esta sonda despegó y tuvo un funcionamiento correcto hasta que meses después de su lanzamiento se perdió la señal.

**La fuente del problema fue una orden errónea** (se transmitió un "+" en lugar de un "-"). Incapaz de controlarla correctamente, la Phobos 1 dejó de orientar sus paneles solares hacia el sol. Sin energía, no pudo restablecerse contacto con ella.

El bug estaba localizado antes del lanzamiento, pero **por falta de tiempo desarrollaron un parche que no controlaba todas las casuísticas**.

## Mariner 1, el desvío de su trayectoria

En este caso fue un proyecto de la NASA perteneciente al [programa Mariner](https://es.wikipedia.org/wiki/Programa_Mariner), cuya misión era sobrevolar Venus.

Al poco tiempo de su lanzamiento, [se desvió de su trayectoria por un fallo en el software](https://es.gizmodo.com/como-una-sola-errata-de-codigo-le-costo-a-la-nasa-150-m-1827097911). Existía la posibilidad de que este cayese en el Océano Atlántico cerca de las rutas transatlánticas y esto provocase una catástrofe.

Para evitarlo, se envió un comando de autodestrucción antes de que la sonda se soltara y cayera a un lugar no controlado.

Entre otro errores en el lanzamiento, después de varias investigaciones, descubrieron que en una de las instrucciones enviadas al cohete faltaba un guión, lo cual provocó dicho desvío.

## Sidekick y la pérdida de datos

En 2009 casi 1 millón de de usuarios fueron afectados por [la pérdida de los datos personales de teléfonos Sidekick](https://www.xatakamovil.com/varios/los-poseedores-de-sidekicks-se-quedan-sin-sus-datos).

**Un fallo en una actualización de T-Mobile y Microsoft hizo que perdieran sus agendas de contactos, notas, calendarios y fotos**, que residían en un servidor en la nube y no en sus terminales personales.

Aunque a los pocos días muchos usuarios recuperaron sus datos, otros no tuvieron tanta suerte. T-Mobile abonó entre 20$ y 100$ a los clientes, dependiendo del daño causado a cada uno.

## Libros borrados de Kindle

También en 2009 [Amazon accedió a los Kindle de algunos usuarios y borró parte de su contenido](https://www.xataka.com/privacidad/amazon-accede-a-los-kindle-de-algunos-usuarios-y-borra-parte-de-su-contenido), para ser más exactos los títulos eliminados fueron ‘1984’ y ‘Animal Farm’, ambos de George Orwell.

Más que la eliminación de los libros, **saltaron las alarmas por el hecho de que Amazon pudiera entrar a borrar datos de los lectores de libros Kindle**, pues no parece normal que alguien entre en tu casa a llevarse un libro que ya habías comprado.

Un bug en esos sistemas podría hacer que contenidos o software comprado para libros electrónicos o teléfonos móviles desapareciera sin dejar rastro.

## Suecia y la desaparición del .se

¿Os imagináis levantarnos una mañana y no poder acceder a ninguna web de vuestro país? Yo no me imagino levantarme una mañana y no poder leer las noticias del Betis.

Este es uno de los bugs más llamativos que he escuchado, [el día que Suecia al completo (.se) fue borrada del mapa de Internet](https://www.lainformacion.com/estilo-de-vida-y-tiempo-libre/el-dia-que-suecia-al-completo-se-fue-borrada-del-mapa-de-internet-por-error_IyNsyYOdrwy56L226UskT6/).

**Fue causado por un solo carácter en una línea de código** (faltaba un punto). **Esto provocó un fallo que duró horas, días incluso para algunos proveedores**.

La gente simplemente no podía acceder a ninguna página web alojada en el dominio de Suecia (.se) porque el servicio de nombres pensaba que no existían.

## Dosis letal de rayos X

Al principio del post hablaba de la importancia de los procesos de calidad que rodean un producto, ya que estos pueden acarrear graves consecuencias no solo económicas.

Pues bien, [Therac-25](https://es.wikipedia.org/wiki/Therac-25) era una máquina diseñada para la radiación terapéutica. Debido a un fallo en su software, **una serie de pacientes recibieron una dosis de rayos X que no era la esperada, provocando varios fallecidos entre los muchos afectados**.

## Corte de servicio móvil

La sociedad en la que vivimos sufre una cierta “adicción” al móvil. [Se calcula que 1 de cada 3 usuarios consultan su smartphone más de 100 veces al día](https://www.abc.es/familia/vida-sana/abci-cuantas-veces-miras-movil-dia-201901080157_noticia.html).

Hace no mucho, **cientos de miles de clientes de una conocida operadora móvil perdieron el servicio durante casi un día completo es España. Esto les impidió tanto la posibilidad de realizar o recibir llamadas como de usar Internet**.

Aunque las cantidades recibidas por cada usuario fueron ridículas, la operadora tuvo que compensar a todos los clientes afectados.

## Conclusiones

Mostrando este histórico de bugs no se pretende asustar a nadie. La idea es hacer ver las cosas que llegan a pasarles a gigantes, como la NASA o Amazon por no tomarse la calidad con la seriedad que esta requiere.

**Son muchos los proyectos y clientes en los que, por falta de tiempo, se acaba recortando tiempos y calidad en sus distintos procesos**. Esto no es nada nuevo y por desgracia no es algo que vaya a cambiar de un día para otro.

Desde el equipo de QA de Paradigma luchamos y seguiremos luchando para que se respeten los tiempos y las cosas se hagan bien y con la calidad necesaria.

> “La recompensa del trabajo bien hecho es la oportunidad de hacer más trabajo bien hecho”. **Jonas Edward Salk**

## ¿Te has quedado con ganas de más?

¡No te pierdas este podcast!

[![](https://www.paradigmadigital.com/profilePics/300/da5a56137c57259ad0083cbfd84fec05aad3024bb7368f7f5c1b8d4a83de2530.jpg "undefined")](https://www.paradigmadigital.com/author/rmarquez/)

Rafael Márquez

Quality Assurance con más de 10 años de experiencia. Enamorado de las nuevas tecnologías y de todo lo relacionado con la calidad de software. Apasionado del deporte, con el “Manque Pierda” como filosofía de vida.

[](https://www.paradigmadigital.com/author/rmarquez/)


# ​Errores de Software ​​​​  

  
  

Es innegable la importancia que los sistemas de información juegan en la actualidad. La diversidad de aplicaciones es tan amplia que resulta poco probable encontrar áreas del quehacer humano donde no haya intervenido una computadora y por lo tanto, el software. Aunque tenemos la idea generalizada que el software es infalible, lo cierto es que los errores y fallas son mucho más frecuentes de lo que pensamos. En este sentido, el mal diseño de un sistema, la falta de estándares adecuados en el desarrollo de programas o las malas prácticas de programación, conllevan no solo fallas en los resultados de uno o más procesos sino millonarias pérdidas económicas, tecnológicas y hasta humanas. 

  

Como es bien sabido en el ámbito de la ingeniería de software, los errores en un sistema de información pueden aparecer en distintas fases de su desarrollo: toma de requerimientos, análisis, diseño, programación, pruebas o implementación; así pues, entre más tarde se detecte la falla, más costoso será corregirla. Por ejemplo, un error de omisión de un campo en las últimas fases del desarrollo (la descripción de un producto, la clave de un empleado o las placas de un vehículo no incluida en la base de datos), representará darlo de alta en el diccionario de datos, modificar todos los reportes y pantallas de captura donde intervenga y reprogramar los módulos de algunos o quizá todos los procesos. 

  

Lo anterior implica retrasos importantes en la entrega del sistema, aumento en costos y seguramente el enfrentamiento de múltiples errores colaterales. Por otra parte, los errores pueden ser tan sutiles como reemplazar un símbolo por otro (emplear el signo menos por el más en una operación) pero que origina graves errores en los resultados de un programa. De acuerdo a una encuesta realizada en 2015 por Statista, en el Reino Unido se reportaron problemas con los sistemas de información debido a tres causas fundamentales: fallas de software (23%), errores humanos (28%) y ataques informáticos (49%). Asimismo, una encuesta realizada en Estados Unidos durante ese año, mostró que el 43% de las causas que originan la baja calidad en los datos de un sistema de información son por errores en el software, cifras muy elevadas si hablamos del costo que representa desarrollar un sistema más la infraestructura que gira a su alrededor.

​  

Así pues, una falla de software por minúscula que sea, tiene implicaciones diversas; tal es el caso de la sonda espacial MCO (Mars Climate Orbiter) lanzada en 1998 y cuyo objetivo era rastrear el clima de Marte y transmitir los datos obtenidos a la Tierra; sin embargo, justo al realizar las maniobras de inserción a la órbita marciana, se perdió toda comunicación con el satélite. La junta de investigación de accidentes determinó que el origen de esta millonaria pérdida fue debido a que los datos generados por el programa que calculaba el rendimiento del propulsor estaban en unidades inglesas y que a su vez, los resultados de este proceso eran utilizados por otro módulo que determinaba la desaturación del movimiento angular, pero los requería en unidades MKS. Esta incompatibilidad de unidades originó pequeños errores traducidos en una trayectoria seguida por la nave 170 kms más baja que la planeada, dando como resultado la destrucción del orbitador en la atmósfera de Marte. 

  

Asimismo, durante el 2003, el noreste y medio oeste de Estados Unidos así como la provincia de Ontario en Canadá, sufrieron un apagón de enormes dimensiones que duró alrededor de 7 horas y en otros lugares hasta una semana, afectando a más de 55 millones de personas. Una de las causas que contribuyeron a este problema fue un error de software. Semanas después de haberse presentado el percance, los ingenieros de General Electric realizaron una auditoría a su sistema. Después de analizar varios millones de líneas de código, detectaron que un error en la programación provocó una falla en el sistema de alarma del centro de control de energía de la empresa FirstEnergy propiciando con ello el apagón. 

​  

En años más recientes los errores de software no han dejado de existir. Durante 2014 el Banco Real de Escocia fue multado con 56 millones de libras esterlinas luego que, por un error de software, fueran cerradas durante varias semanas las cuentas de sus más de 6.5 millones de clientes impidiendo realizar operaciones bancarias. Por otro lado en 2015, Nissan hizo un llamado a más de un millón de sus vehículos debido a que identificó problemas de software vinculados con las bolsas de aire pues el programa no detectaba la presencia de un adulto ubicado en el asiento del acompañante. También en diciembre de ese año, el espacio aéreo londinense fue cerrado por un malfuncionamiento del software encargado de rastrear y planear el despegue y aterrizaje de aviones de uno de los aeropuertos más congestionados del mundo ocasionando que cientos de vuelos fueran cancelados, demorados o desviados. 

  

Estos y muchos casos más, no significan que los errores sean una característica intrínseca en los sistemas de información sino más bien, que los procesos de control y auditoría en las fases de desarrollo no se aplican o son inadecuadas. Si bien es cierto, la industria del software ha relajado considerablemente sus controles de calidad (es una de las razones por las que existen tantas actualizaciones), la realidad es que para muchas empresas, hacer programas sin errores no es rentable pues las pruebas y controles que deben aplicar representan costos y retrasos en la liberación de sus productos. Esto impide comprender las consecuencias de adquirir software defectuoso y después esperar a que el proveedor lo corrija, pero nadie en su sano juicio compraría una casa nueva sin cimientos o con paredes agrietadas aun si el vendedor se comprometiera a reparar las fallas. La diferencia es que el software es intangible y los errores no se ven sino hasta el momento en que el programa se ejecuta y se dan las condiciones que evidencian la falla manifestándose por lo general en bloqueos del programa, errores de datos o pérdidas de información. 

  

Si bien es cierto ningún sistema de información es infalible, la tasa de errores puede disminuir considerablemente en la medida que se apliquen adecuadamente los procesos y controles señalados en la ingeniería de software; esto dará como resultado, sistemas de mejor calidad y altamente confiables.

# ¿Cómo puede dañar a tu proyecto de desarrollo de software, la falta de buenas...

En el dinámico mundo del desarrollo de software, la calidad es un factor crucial que puede determinar el éxito o el fracaso de un proyecto.

---

By Sabia dev

Jul 19, 2024 03:42 PM

4 minutos de lectura

Ver original

---

En el dinámico mundo del desarrollo de software, la calidad es un factor crucial que puede determinar el éxito o el fracaso de un proyecto. Un proceso robusto de Aseguramiento de la Calidad (QA) no solo garantiza que el producto final cumpla con las expectativas del cliente, sino que también mejora la eficiencia del equipo de desarrollo y reduce los costos a largo plazo.

En nuestra reciente campaña, hemos introducido «El Mundo de los Enemigos de la Calidad». En este universo paralelo, personificamos los problemas más comunes que afectan la calidad del software a través de tres personajes únicos: Vagus, Bugashi y Engorro. Estos «monstruos» representan los requisitos confusos, los errores de funcionalidad y un mal rendimiento aplicativo, respectivamente.

A lo largo de este artículo explicaremos metafóricamente, cómo estos personajes son capaces de impactar negativamente en la calidad de los productos digitales dentro del desarrollo de software y explicaremos las estrategias que recomendamos implementar para combatirlos.

## Las amenazas ocultas del Desarrollo de Software

Los problemas que surgen de un proceso de QA deficiente no solo afectan la funcionalidad del producto final, sino que también pueden generar costos adicionales, retrasos en el proyecto y una experiencia de usuario insatisfactoria. En esta sección, exploraremos cómo los problemas representados por los personajes de nuestra campaña, Vagus, Bugashi y Engorro, pueden impactar negativamente en la calidad del software y cómo Tsoft puede ayudar a tu organización a enfrentarlos y superarlos.

Los problemas que surgen de un proceso de QA deficiente, no sólo afectan la funcionalidad del producto final, sino que también puede generar costos adicionales, retrasos en el proyecto y una experiencia de usuario insatisfactoria.

¿Cómo los Enemigos de la Calidad afectan la calidad dentro del desarrollo de software?

### Vagus – La confusión en los Requisitos

**Descripción del problema**: Vagus, el camaleónico desorientador de requisitos, personifica la falta de claridad en la definición de los requisitos del proyecto. Cuando los requisitos son vagos o mal definidos, los equipos de desarrollo se encuentran perdidos en un laberinto de interpretaciones y malentendidos. Esto conduce a múltiples iteraciones, retrabajos y, en última instancia, a un producto final que no cumple con las expectativas del cliente.

**Impacto real**: Imagina que estás desarrollando una aplicación crítica para el negocio, pero los requisitos cambian constantemente o son tan ambiguos que cada miembro del equipo tiene una comprensión diferente de lo que se debe hacer. Esto no sólo ralentiza el progreso, sino que también aumenta significativamente el riesgo de errores costosos y fallos en el producto.

**¿Cómo podemos ayudar?**: Nos especializamos en ayudar a las organizaciones a establecer procesos claros y precisos para la definición de requisitos. A través de talleres de análisis de requisitos y metodologías de gestión de proyectos, aseguramos que todos los involucrados tengan una comprensión unificada y detallada de lo que se debe lograr.

### Bugashi – Los errores de Funcionalidad

**Descripción del problema**: Bugashi, el espíritu ninja de los errores, representa los errores de funcionalidad que se infiltran en el código durante el desarrollo. Estos errores pueden ser difíciles de detectar y corregir, especialmente si no se cuenta con un proceso de QA efectivo. Los errores de funcionalidad no solo afectan la experiencia del usuario, sino que también pueden poner en riesgo la seguridad y la estabilidad del sistema.

**Impacto real**: Considera un escenario donde un error en el código provoca fallos intermitentes en una aplicación financiera. Estos fallos no sólo frustran a los usuarios, sino que también pueden llevar a pérdidas financieras significativas y dañar la reputación de la empresa.

**¿Cómo podemos ayudar?**: Ofrecemos servicios avanzados para generar una cultura de testing de software que incluya pruebas automatizadas y continuas, asegurando que cada línea de código y cualquier cambio al software sea verificado y validado meticulosamente. Nuestras soluciones de QA están diseñadas para apoyar en la identificación y corrección de errores antes de que lleguen al usuario final, garantizando un producto funcional y de alta calidad.

### Engorro – La ineficiencia y lentitud

**Descripción del Problema**: Engorro, el troll de la lentitud, encarna la ineficiencia y los cuellos de botella en el ciclo de desarrollo de software. La falta de optimización y la sobrecarga de recursos pueden ralentizar el rendimiento de tus aplicaciones, aumentando costos, y generando mala experiencia en tus usuarios finales.

**Impacto Real**: En aplicaciones críticas para el negocio, los tiempos de respuesta elevados, la fata de disponibilidad y los errores constantes a los que se enfrenta un usuario, genera frustración y sensación de poca confiabilidad, lo disminuye su satisfacción y deriva en pérdida de negocio.

**¿Cómo podemos ayudar?**: nuestro equipo de especialistas ayuda a identificar y eliminar los cuellos de botella en situaciones de máxima demanda a través de auditorías de rendimiento y optimización de recursos. Implementamos prácticas de desarrollo ágil y refactorización de código para asegurar que tus proyectos digitales se desarrollen de manera eficiente y sin interrupciones.

## Conclusión

Los problemas que representan estos personajes, son sólo la punta del iceberg en los desafíos que deben superar las organizaciones dentro del desarrollo de software. Por ello, desde Tsoft nos dedicamos a implementar procesos y mejores prácticas de QA robustos con el fin de apoyar a las organizaciones a superar obstáculos, asegurándonos de que cada producto final sea de la más alta calidad.

Garantizamos nuestro compromiso para ayudar a tu organización a combatir a estos «enemigos de la calidad» para lograr que tus proyectos de software tengan éxito.

¡Contáctanos hoy! y recibe apoyo de nuestro equipo para transformar tus procesos de desarrollo y lograr una verdadera calidad incorporada.

Autor