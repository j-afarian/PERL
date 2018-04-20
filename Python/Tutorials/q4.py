#!/usr/bin/env python

# Write a function named longest which accepts a list of
# strings and finds the longest string, returning both
# it's index and value.

import sys

longestString = 0
longestIndex = 0

def longest(stringList):
    global longestString
    global longestIndex

    for index, string in enumerate(stringList):
        length = len(string)
        
        if length > longestString:
            longestString = length
            longestIndex = index

    return [longestString, longestIndex]

newString = ("Amy", "Claire", "Elle", "Georgiana")

result = longest(newString)

print "The longest string has a length of", result[0], "and index", result[1]


