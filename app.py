import json, random
from time import sleep
import os

def get_json_files():
    json_files = [file for file in os.listdir('data') if file.endswith(".json")]
    return json_files

files = get_json_files()
jokeHist = ['x','x','x','x','x','x','x','x','x','x']

with open('data/'+files[0], mode ='r', encoding= 'utf-8') as f:
    data=json.load(f)

def random_joke(data):
    generate = True
    while generate:
        num = random.randint(0,len(data))
        if num not in jokeHist:
            dummy= jokeHist.pop(0)
            jokeHist.append(num)
            generate = False           
    return data[num]

while True:
    joke = random_joke(data)
    print(joke['title'][:-2])
    print(joke['text'])
    sleep(3)

