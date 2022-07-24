import sys
import pyshorteners
import validators

main_url = sys.argv[1]

if(validators.url(main_url)):
    url_shortener = pyshorteners.Shortener()
    short_url = url_shortener.tinyurl.short(main_url)
    print("The Short URl: " + (short_url))
else:
    print("no es una url valida") 
