import requests
import re

html = requests.get('https://6music.sharpshooterlabs.com/#')
artist = re.search(r'(?<="artist">)(.+?)(?=<)', html.text).group()
title = re.search(r'(?<="title">)(.+?)(?=<)', html.text).group()
output = artist + ' - ' + title
output = output.replace('&amp;', 'and')
print(output, flush=True)
