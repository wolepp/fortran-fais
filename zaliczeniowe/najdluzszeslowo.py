#!/usr/bin/env python

FILE="slowa.txt"

max_len = 0
max_slowo = ''

with open(FILE, 'r') as f:
    for line in f:
        if len(line) > max_len:
            max_len = len(line)
            max_slowo = line

print(max_slowo)
print(max_len)
