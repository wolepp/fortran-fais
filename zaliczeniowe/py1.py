#!/usr/bin/env python

with open("liczby-naturalne.txt") as f:
    wektor = [int(line) for line in f.readlines()]

parzyste = [x for x in wektor if x%2==0]
nieparzyste = [x for x in wektor if x%2!=0]

print(f"Suma parzystych: {sum(parzyste)}")
print(f"Suma nieparzystych: {sum(nieparzyste)}")
