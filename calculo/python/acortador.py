import pyshorteners

main_url = "http://www.learningaboutelectronics.com/Articulos/Calculadora-de-conversion-de-coordenadas-cartesianas-a-cilindricas.php"
#initialize the Shortener
url_shortener = pyshorteners.Shortener()
#short the url with tinyurl
short_url = url_shortener.tinyurl.short(main_url)


print("The Short Url of {main_url} is: ")
print(short_url)
