import json

with open('sources-2.json') as json_file:
    data = json.load(json_file)
    for p in data['sources']:
        print(f'- {p["description"]}, {p["short-url"]}')
