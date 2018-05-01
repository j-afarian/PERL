#!/usr/bin/env python

# Jenna Afarian - s3511312

def magic (s):
    dict = { "a":1, "e":2, "i":3, "o":4, "u":5 }

    try:
        return dict[s]
    except KeyError:
        return 0
