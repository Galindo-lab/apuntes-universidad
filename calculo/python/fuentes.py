fuentes = [
    [
        "Calculadora De Cartecianas A Clindricas",
        "http://www.learningaboutelectronics.com/Articulos/Calculadora-de-conversion-de-coordenadas-cartesianas-a-cilindricas.php"
    ],
    [
        "Coordenadas Cilindricas A Cartesianas",
        "https://www.neurochispas.com/wiki/coordenadas-cilindricas-a-cartesianas/"
    ],
    [
        "Calculadora De Conversion De Coordenadas Cilindricas A Esfericas",
        "http://www.learningaboutelectronics.com/Articulos/Calculadora-de-conversion-de-coordenadas-cilindricas-a-esfericas.php"
    ],
    [
        "Coordenadas Cilidnricas Y Esfericas",
        "https://math.libretexts.org/Bookshelves/Calculus/Book:_Calculus_(OpenStax)/12:_Vectors_in_Space/12.7:_Cylindrical_and_Spherical_Coordinates#:~:text=To%20convert%20a%20point%20from,r2+z2)."      
    ],
    [
        "Coordenadas Cilindricas Y Coordenadas Esfericas Calculo Vectorial",
        "https://temasdecalculo.com/2017/12/18/4-14-coordenadas-cilindricas-y-coordenadas-esfericas-calculo-vectorial/"
    ],
    [
        "Defeinicion De Vector",
        "https://ingemecanica.com/tutoriales/calculo_vectorial.html"
    ],
    [
        "Producto Mixto",
        "https://es.wikipedia.org/wiki/Producto_mixto"
    ],
    [
        "Producto Punto Por Zach Star",
        "https://youtu.be/TBpDMLCC2uY"
    ],
    [
        "Ángulos Directores",
        "https://www.superprof.es/diccionario/matematicas/analitica/cosenos-directores.html"
    ],
    [
        "Volumenes Y Área",
        "https://www.superprof.es/apuntes/escolar/matematicas/analitica/distancias/areas-y-volumenes.html#tema_volumen-de-un-tetraedro"
    ]
]




f = open("sources.json", "a")
f.write("["+'\n')

for fuente in fuentes:
    f.write(f'\t{{\n\t\t"description":"{fuente[0]}",\n\t\t"long-url":"{fuente[1]}"\n\t}},\n')

f.write("]"+'\n')
f.close()

print("done")
