import json
import pyshorteners
import pyshorteners
from random import random








foo = {}
foo['sources'] = []


with open('sources.json') as json_file:
    data = json.load(json_file)
    for p in data:
        main_url = p['long-url']
        # initialize the Shortener
        url_shortener = pyshorteners.Shortener()
        # short the url with tinyurl
        short_url = url_shortener.tinyurl.short(main_url)
        # write json
        foo['sources'].append({
            'description': p['description'],
            'long-url': p['long-url'],
            'short-url': short_url
        })


        
with open('sources-2.json', 'w') as outfile:
    json.dump(foo, outfile, indent=4)
