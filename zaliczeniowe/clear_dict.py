#!/usr/bin/env python
import chardet

IN_FILE="pl_PL.dic"
OUT_FILE="slowa.txt"

inp = open(IN_FILE, 'r', encoding='ISO-8859-2')
out = open(OUT_FILE, 'w')

c = 0
limit = 100

polskie_znaki = [
    'ę',
    'ó',
    'ą',
    'ś',
    'ł',
    'ż',
    'ź',
    'ć',
    'ń',
    'Ę',
    'Ó',
    'Ą',
    'Ś',
    'Ł',
    'Ż',
    'Ź',
    'Ć',
    'Ń',
]

ktore = 0
co_ktore = 11

for line in inp:
    if any(litera in line for litera in polskie_znaki):
        continue
    
    if "/N" in line:
        czyste_slowo = line.split('/')[0]
        if (czyste_slowo.lower() == czyste_slowo):
            if not ktore % co_ktore:
                out.write(czyste_slowo + '\n')
            ktore += 1
