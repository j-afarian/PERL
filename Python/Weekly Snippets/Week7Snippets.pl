#!/usr/bin/env python

# Jenna Afarian - S3511312

# ------------------ INTRODUCTION TO PYTHON ------------------
# All python programs have the benefits of "scripts" that there is no compile
# or link operation required. It is a general purpose language though
# and commonly used to write large, complex systems across many problem domains.
#
# Everything in python is an object, but you're not forced to write your
# code in classes - can just write functions like in C if preferred.
#
# Why Python?
# Syntax is simple, powerful, and effective.
# It comes with a library of useful tools.
# 
# Python in the real world
# - Google, Youtube, NASA, Ubuntu
# - Sketch: a vector graphic editor
# - EVE Online is written in stackless python

# HELLO WORLD IN PYTHON
print "Hello World"
# In python 3, this has been replaced with print("Hello World")

# -------------------- Running Python ---------------------
# Python may be used interactively, or from scripts.
# The interpreter may be run wth the "python" command.
# It's a good way to text syntax, check modules, etc.
#
# Special variable ONLY in interactive mode : _
# It means "the last result"

# ------------------- Variables -------------------
num = 30
num += 12
print num

i = 1
j = i
i = "two"
print j
print i

# ----------------- Data Types --------------------
# Python is strongly typed, all data is of a specific type.
#
# Data types in Python are heterogeneous
# - Variable can point to data of any type.
# - You can point a variable to new data of a different type.
# - If you perform an operation on an incompatible type (i.e adding
#   an integer to a string) you will get a runtime error.

a = 1
b = "two"
#print a + b    # error
a = "one"
print a + b    # onetwo
a = 1.0
b = 1
print a + b    # 2.0

# Python has the following simple data types:
# - Integers: Positive or negative whole numbers
# - Floats:   Real numbers
# - Strings:  Strings of single byte characters
# - Unicode:  Strings of unicode characters
# - Complex:  Complex numbers (1+2j)
# - Boolean:  True or False

# -------------------- Numbers --------------------
print 3 * 4    # 12
print 3 ** 4   # 81

# ** is the exponentiation operator. 3 ** 4 is 3 to the power of 4.

# ------------------ Strings -------------------
# Surrounded by single or double quotes. No difference between
# these quotes in Python, both provided for convenience. 
print "abc"
print 'abc'
print "this is a 'single' quote"

# ------------------- Escape Characters ----------------
# "Don't panic" is the same as 'Don\'t panic'
# To put a backslash into a string you must double \\

# ----------------- Special Characters -----------------
# Common ones are \n for newline and \t for tab.
# Can use \xnn to specify arbitrary ASCII values in hex. Python strings
# are single byte character, i.e. nn can be any value from 0 to FF inclusive.

# Example of whitespace in a string
print "ahh...\n\t\tchoooo"

# ----------------- Representation ------------------
#
