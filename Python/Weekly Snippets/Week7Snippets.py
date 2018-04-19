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
#a = 1
#repr(a)     # '1'
#a = [1, 2, 'foo']
#repr(a)   # "[1, 2, 'foo']"
#eval(a)    # [1, 2, 'foo']

# --------------- Multiline Strings -----------------
# For strings with many lines you can use triple quotes.
# Can use single or double quote marks.
print '''this is line 1
   and line 2
   and line 3'''

# --------------- Working with strings ----------------
# len() function returns length of a string.
print len("wibble")        # 6

# Strings can be joined with the + operator
print "Ex-" + "parrot"

# Adjacent string literals are automatically conactenated
print "Ex-" "parrot"

# Repeating strings may be generated with the * operator
print "Test" * 8

# Can get characters of a string using the [] operator and
# specifying a zero-based index
print "Ptang!"[1]

# ------------- Converting to and from ASCII --------------
# ord() returns ordinal (ASCII) value.
# chr() returns the character with that numbers ordinal.

print chr(65)   # 'A'
print ord("B")  # 66

# Note: Python does not have a character type. Characters are
# strings of length 1.

# ------------------- Boolean ---------------------
# bool has two values, True and False
print bool(0)   # false
print bool(1)   # true
print bool(2)   # true

# ---------------------- Unicode ---------------------
# Unicode strings contain multi-byte characters, and allow for
# CJK characters, accented character sets, and the myriad of
# other glyphs that ASCII and extensions to ASCII do not cater
# for. Unicode strings look like regular strings, but are 
# preceeded with a u:
print u"\u20ac"

# Print emoji :)
print '\U0001F602'.decode('unicode-escape')

# Other literal strings : "raw"
# Easier entry of strings with backslashes
print r"C:\Windows\System32\Drivers"

# Common when working with Windows system paths and regex.

# ---------------- Data Tyle Conversion -----------------
# str(), int(), and float() convert to their respective types.

print int(123)
print float(123)
print str(123)

# ------------------ The None Value ----------------------
# - None is an explicit absence of value
# - None is false
# - None is it's own type (NoneType)

print bool(None)
print type(None)

# None is not the same as 0, empty strings/lists, etc.
# - 0 may be zero, but is still numeric
# - "" may have length of 0, but is still string
# - None is the absence of any value
# - None is the value returned by function calls if there is
#   no explicit return value.

# ----------------- Composite Data Types -----------------
# - Lists: Extensible, mutable sequences of objects.
# - Tuples: Fixed, immutable collections of objects.
# - Dictionaries: Mappings from keys to values.
# - Sets: Collections of unique objects, set is mutable, 
#   frozenset is immutable and hashable.

# ---------------------- Tuples -------------------------
# Allow you to group various data elements into one.
# Written in brackets.
a = (1, 2, 3)
b = (("Bob", "Smith"), 73.5, "555-1234")

# Elements may be of different types, so tuples may be nested.
# For a tuple with 1 element, but use a comma before closing bracket

a = (1)
print type(a)    # int
a = (1,)
print type(a)    # tuple

# Elements of a tuple can be accessed at their index ([]).
a = ((1, (2, 'fnord')), 4, 5)
print a[0][1][1]   # fnord
print a[2]      # 5

# The len() function can return the number of elements in a tuple.
# Each nested tuple = 1 element.
a = ((1, (2, 'fnord')), 4, 5)
print len(a), len(a[0])      # 3, 2

# Tuples are immutable, you cannot change a tuples elements.
# Attempting to modify them will result in an error.

# Strings and numbers are also immutable.
# You can make a new tuple by concatenating tuples.

a = (1, 2) + (3, 4)
print a    # (1, 2, 3, 4)

# ----------------------- Lists ---------------------------
# Similar to tuples, but flexible, enclosed in square brackets [].
a = [2, 3, 4]
b = ["bob", 4.3]

# len() works the same as tuples.

# Lists are mutable and can be changed.
a[1] = "Paul"
print a     # [2, "Paul", 4]

# Aside: Methods
# Some python data objects (eg. lists) have methods you can call.
# They are called with object.methodname(args).

# ------------------- Sequence Types ----------------------
# Lists, tuples, and strings are sequence types.
# - Have a length (can find with len())
# - Can take an element of a sequence with square brackets [].
# - Can take a slice of a sequence (subsequence).
# - Can iterate over them with for.

# Ducking type
# "When I see a bird that walks like a duck, swims like a duck,
# and quacks like a duck, I call that bird a duck."
#
# In other words, don't check whether it IS a duck, check whether it 
# QUACKS like a duck, WALKS like a duck. 
#
# Duck typing in python is the file-like classes.
# Most function or method that you may think would only accept an
# open file will actually accept anything that implements a read() method
# that returns a string.

# ------------------ Elements of Sequence ------------------
a = ("My", "brain", "hurts")
print a[1] #brain

# Negative index counts from the end of the sequence
print a[-1] #hurts

# ------------------ Slices of Sequences ------------------
# Take a slice by selecting a range of elements. Notation: [from:to].

print "Python"[1:4]    # "yth"
print "Python"[2:]     # "thon"
print "Python"[:3]     # "Pyt"
print "Python"[1:-1]   # "ytho"

# --------------------- Dictionaries -----------------------
# Maps keys to values.
# - Contains zero or more unique keys, and one value for each key.
# - Given a key, a dictionary can retrieve its corresponding value.

# Python dictionaries are similar to Perl's hashes.
#
# Useful for any application where you need to look things
# up by a key (phone directory: map names (key) to ph# (values).
#
# Often strings, but tuples, integers and other hashable objects are valid keytypes.

# ----- dict()
# Dictionary form {key1:value1, key2:value2}
# Empty dictionary: {}
#
# The below two are equivalent:
phonebook = { "Amy" : "555-1234", "Basil" : "555-0987" }
phonebook2 = dict(Amy="555-1234", Basil="555-0987")

print phonebook
print phonebook2

# -------------------- Working with Dictionaries -------------------
# Dictionaries are mutable, can use the [] operator to access 
# and assign elements to the dictionary.

phonebook = {}
phonebook["Amy"] = "503-954-5657"
phonebook["James"] = "604-379-5657"
print phonebook["Amy"]
print phonebook["James"]

# Check whether a dictionary has a certain key using the 'in' operator:
print "Amy" in phonebook
print "Joe" in phonebook

# Attempting to access a nonexistent key in a dictionary will cause KeyError
# Safe retrieval from dictionary using get() returns none if can't be found:
phonebook = {"Amy" : "503-956-4321"}
print phonebook.get("Basil")

# ------------------ Iterating over dictionaries --------------------
# Can iterate over keys, but keys are unordered, and they will be
# retrieved in an arbitrary order which is non-random but varies
# across Python implementations, & depends on insertion/deletion history.

dictionary = {"b":1, "a":2}
for key in dictionary:
   print key, "maps to", dictionary[key]

# Getting a list of keys in the dictionary using the keys method:
print phonebook.keys()

# ------------------- Conditional Branching ----------------------
# if condition:
#    statements
#    statements
# elif some other condition:
#    statements
# else:
#    another

# - elif and else are optional.
# - Can have as many elif clauses as you want.
# - conditions are expressions

# Where are the curly brackets?
# Indentation is important, all statements in the same block must
# be indented by the same number of space/tabs.
# 
# Each block must be indented by more than its enclosing block.
#
# Bad indentation can be a syntax error.

# ---- How to do nothing in a branch?
# Control structures cannot have empty bodys, use pass.

foo = 2

if foo == 0:
   pass
else:
   print "foo is not 0"

# ----------------- Statements and Expressions ----------------
# Expressions and Statements are separate concepts. 
# - An expression can always be used as a statement.
# - A statement cannot be used as an expression.

3 + 4
print 5 + 6

# Line 1 is an expression, it's evaluated and comes out to a value.
# Line 2 is a statement. It commands python to do something & is executed.
# Line 2 is a statement which contains an expression (5+6).

# A function call is an expression: len("abc") has the value 3.

# ----------------- Condition Expressions -------------------
# Supports the usual conditiona expressions. ==, >, <, <=, >=
#
# Any object can be tested for truth value.
# - 0, 0L, 0.0, 0j, None, False, "", [], (), {} are all considered false.
# - Strings, lists, tuples etc with contents are considered true.

value = "ni!"
# The following are true:
# - if true: do_something()
# - if len(value) > 0: do something()
# - if value: do_something()

# Conditions can be combined using boolean operators, and, or, not.
password = "Ptang!"
bored = "";
action = "list"

if action == "list" or password == "Ptang!":
   print "Ptang Ptang!"
while not bored:
   print "I'm having fun!"
   bored = "nope"

# Pythons and, or, and not are not equivalent to &&, ||, and !

# Testing for membership of a collection
# Operator returns true if left value is a memeber of the right collection.

sure = raw_input("Are you sure? ")
if sure in ("yes", "y", "aye-aye sir!"):
   print "They're absolutely sure!"
else:
   print "They're not really sure..."

# Looping: while
# while condition:
#    statement

# This is execute the statements contained in the whole block until
# the expression evaluates to false.

# Print all fibonacci numbers under 1,000:
a, b = 0, 1
while b < 1000:
   print b,
   a, b = b, a+b

# - Note the mutple assignment.
# - Trailing comma on the print statement means do not end the line (invalid
#   in Python 3 as it is invoked as a function.

# --- Aside: Multiple assignment
# All values are copied simultaneously, known as an atomic operation.
# Saves us from having temporary variables.

# ----------------------- Looping: for ------------------------
# for var in list:
#    statements

for name in ["Amy", "Jane", "Claire"]:
   print "Hello,", name

# The range() function generates a list of numbers:
for i in range(5):
   print i

# ------------------ Optional Looping Extras -------------------
# There are three optional extrals you may use in while and for loops:
# - continue : causes the execution of code to jump to next iteration.
# - break    : exit the loop immediately
# - else     : may appear at the end of the loop, only iterated if loop
#              finishes executing normalling (no break).

# ---------------------- Calling Function -------------------
# Must add parentheses after a function name to call it, regardless
# of whether it takes arguments or not.
print dir()

# without parentheses we are accessing the value of the variable dir:
print dir
x = dir
print x()

# In python 2, print is not a function, but it is in Python 3.
# A function call always returns a value, even if the value is "none".
#
# Brackets () invoke the function, they call anything as long as its callable.

# ----------------- Defining Functions ---------------------
# Define functions with the def statement.
# def funcname(arglist)
# Use return to return a value.

def fibo(ceiling):
   result = []
   a, b = 0, 1
   while b < ceiling:
      result.append(b)
      a, b = b, a+b
   return result

for num in fibo(1000):
   print num,

# ---- Slightly more complex example
# (see additional scripts)
# This example uses sys.arv.
# - import sys makes the sys module available to the program
# - sys.argv is a python list containing a list of command-line arguments.
# - sys.argv[0] is always the name of the script.
# - The arguments start from the second element (sys.argv[1]).
# - If you wish to exit a program can use sys.exit().
#      - If the exit should indicate an error, pass it to exit().
