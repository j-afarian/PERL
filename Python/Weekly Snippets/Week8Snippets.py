#!/usr/bin/env python

# Jenna Afarian - S3511312
# Week 8 - Data Types

# "---------------------------- Lists vs Tuples ---------------------------"
# Lists are more flexible than tuples, as their content can be changed.
# Tuples use less memory.
# Tuples and other sequences may be 'unpacked'.

a, b = 0, 1
# is equivalent to
a, b = (0, 1)
print a
print b

# If you do not need to create a dynamic data structure, it's probably better
# to use a tuple, as they can be used as a dict with keys, but lists cannot.

d = {}
d[(1,2)] = "some data"
# whereas the following is not allowed:
# d[[1,2]] = "some data"

# Optional brackets for tuples applies here too, can be written as:
d[1,2] = "some data"

# Can treat the dictionary as a 'sparse multi-dimensional array'
# (dictionaries with non-string keys)

# "--------------------- Common uses of tuples -----------------------"
# often used for returning more than one value from a function.
# - Python functions return one value
# Can bundle a number of values into a tuple and return that
# Unpack the tuple to retrieve the individual values

def sumdiff(a, b):
    return (a+b, a-b)

a, b = sumdiff(5, 3)
print a
print b

# ------------------- String Formatting - the % Operator -------------------"
# The % operator acts like the sprintf fucntion in C when applied to strings.
# - The string is a printf format strings
# - The right argument is a value, or a tuple of values.
# - The result is a string, with the formatting codes replaced with
#   formatted values.
answer = 42
print "The answer is %d."%answer
print "Half of %d is %d."%(answer, answer/2)

# Note: % will stringify any arguments if they are not already strings.

# ----------------- String Formatting and Dictionaries -----------------------"
# The % can be used with a dictionary of named values, each formatting
# code has the key in brackets after the %. Field type must be specified
# after the brackets.
foo = dict(name="Paul", phone="0413-333-222", email="paul@email.com", age=33)
print """
Name: %(name)s   %(age)d years old
Telephone: %(phone)s
Email: %(email)s"""%foo

# ------------------------- String Methods -------------------------------"
# Python strings have a number of methods, & are immutable, so the
# methods will not change the contents of the string.
# - s.strip() - strip whitespace from both sides of the string
# - s.rstrip() - strip whitespace from the right side
# - s.lstrip() - strip whitespace from the left side

# - strip() is similar to trim() in other languages.
string = "     text     ".strip()
print string

# - s.split(c) - split the string on the character c
# - s.split() - split the string on whitespace
string = "one,two,three".split(',')
print string
print string[1]

# - s.join(l) - join the seuqnce of strings with
print ", ".join(["one", "two", "three"])
print "".join(["one", "two", "three"])

# - upper()
# - lower()
# - title()
# - capitalize()
# - isupper()
# - islower()

print "one".islower() #true
print "one".isupper() #false
print "one".capitalize() #One
print "one two".capitalize() #One two
print "one two".title() #One Two
print "one two".upper() #ONE TWO

# - s.index(t) - find the index of the substring t in s
print "Python".index("th") #2

# ------------------------- More List Methods ---------------------------"
# - l.append(x) - add an element to the end of a list
# - l.extend(m) - append another list to a list
list = [3, 1]
list.append(4)
print list

list2 = ["baked", "beans", "spam"]
list.extend(list2)
print list

# - l.insert(i,x) - insert x into list before position i
# - l.remove(x) - remove the first item of l who's value is x
list = [3, 1, 4, 1, "spam"]
list.insert(2, "Albatross")
print list

list.remove(1)
print list

# - l.pop() - remove and return the last element of a list
# - l.pop(i) - remove and return list element at position i
list.pop() #spam
list.pop(0) #3

# - l.index(x) - return the first position at which x appears in l
# - l.count(x) - returns the number of times x appears in l
print [3,1,4,1,5].index(1) #1
print [3,1,2,1,4,1].count(1) #3

# ---- stack"
# A stack is last in, first out (LIFO).
stack = []
stack.append(3)
stack.append("blah")
stack.append(22.4)
print stack.pop() # 22.4
print stack.pop() # "blah"

# l.sort() - sort the list in place.
list = [3,5,2,1,8]
list.sort()
print list #1,2,3,5,8

# l.reverse() - reverse the list in place.
list.reverse()
print list #8,5,3,2,1

# --------------------- Sorted and Reversed -----------------------"
# These built in functions can be used if you do not wish to modify
# the list contents:

for i in sorted(list):
    print i,

for i in reversed(list):
    print i,

# ---- Everything is sortable"
# A list may contain any number of types of objects when .sort() is invoked.
# Python has rules to handle this:

# 1) If the objects are the same type, or implement the same sorting behaviour
#    they are sorted according to their intrinsic ordering, otherwise;
# 2) All remaining objects are sorted using the name of the type or class.

# Ints and floats are sorted according to their numeric value. 
# Strings are sorted according to ASCII values of their component characters, in order.
# Lists and tuples sort by compairing their elements, in order.

# Sorting is STABLE: objects of equal ordering are not moved in the list relative to each other during sorting.

# ------------------------ More Complex List Sorting -------------------------"
# Lists can be sorted in a custom manner by passing a comparison function to .sort()

print "\n"
print cmp("spam", "egg") #1
print cmp("spam", "spam") #2
print cmp("baked beans", "egg") #-1

foods = {"baked beans": 2, "spam": 5, "egg": 3}
foods = foods.items() # returns a list of dictionaries tuple pairs
print foods

def compare(a, b):
    return cmp(a[1], b[1]) # compare based on value

foods.sort(compare)

for food, count, in foods:
    print count, food

# 5 spam
# 3 egg
# 2 baked beans

# ------------------------- List Comprehensions ---------------------------"
# Allow you to create a new list using a simple for statement, some expressions
# and an optional condition.

# new list = [expression for item in sequence if condition]

# Sequence of squares:
sqr = [num**2 for num in range(10)]
print sqr

# -------------------------- Optional Arguments ---------------------------"
# Functions can have optional arguments which have default values which
# are used unless the caller specifies otherwise.

def hello(name="Unknown"):
    print "Hello,", name

hello()
hello("Elizabeth")

# The default value for the keyword argument is created at function definition
# time. This can create bugs if you're not careful.
# Consider a function that has as its default a list:

def frob(l=[]):
    l.append('a')
    return l

print frob() #['a']
print frob() #['a', 'a']
# The list grows, because the default value is only created once, when we
# execute the def statement creating the functino.
# Every invocation of frob will result in the same list being used as default.
# If no value is passed, we always append to the same list.

# Solution to above is to detect the absence of a list:
def frob(l=None):
    if l is None: l=[]
    l.append('a')
    return l

print frob() #['a']
print frob() #['a']

# ------------------------- Named arguments ---------------------------"
# If a function has many optional arguments, they can be specified
# by name rather than position.
# Function call will contain name=value pairs
# Non-optional arguments can be filled in as normal

def foo(a, b=1, c=2, d=3, e="Bob"):
    print a, b, c, d, e

foo("hello") #hello, 1, 2, 3, Bob
foo("hello", 4, 5) #hello, 4, 5, 3, Bob
foo("hello", c=4, e=5) #hello, 1, 4, 3, 5

# ------------------------- Variable Arguments ----------------------------"
# If the function expects a variable number of arguments can use *args (for
# positional) and **kw (for keyword) to capture them

def foo(*args):
    print "My arguments were", args

foo(1, 2, 3)

def foo(*args, **kw):
    print "My arguments were", args, kw

foo(1, 2, 3, c=10, b=3)

# Variable arguments work both ways.
# Can use them as above in defining functions AND when calling as arguments.
def foo (a, b, c):
    print a, b, c

t = (1, 2, 3)
foo(*t)

# Or with keywords may use a dictionary as the arguments:
def foo(a=1, b=2, c=3):
    print a, b, c

d = {"b": 5, "c":"Jane"}
foo(**d)

# ----------------------- Documentation Strings ---------------------"
# Python has facilities for building documentation into the program code.
# When defining a function, can put an optiona string describing the function
# after the def line.
# - This becomes the functions documentation string
# - Unlike comments, documentation strings are stored by python & may be retrieved.
def add(a, b):
    "Given the numbers 'a' and 'b' return their sum."
    return a + b

#help(add)

# --------------- Functional Programming in Python ----------------"
# Functional programming is a programming paradigm in which programs are
# written as expressiond which are evaluated.

# This is in contrast to imperative programming, in which a program is
# a sequence of instructions, telling a machine to perform certain tasks.

# ---- map()"
# Automatically applies a function to every element of a sequence, returning
# a list of results.
# - First argument is a function which accepts one arg and returns a value.
# - Second argument is the sequence.
# - It returns a list of results.

def square(x):
    return x*x

print map(square, [1, 2, 3, 4, 5])
print map(chr, range(64, 70))
print map(ord, "Python")

# The sequence can be any type (list, tuple, string) but returned
# result is always a list.

# ---- filter()"
# applies a function to every element of a sequence, returning a list of the
# original elements for which the function returns true.
# - First arg is a function which accepts one arg and returns a truth value
# - Second arg is the sequence
# - Returns a list of original values which the func returned true

def check(s):
    return len(s) == 5

print filter(check, ["Amy", "Basil", "Clara", "Jenna", "Sarahjane"])

# return multiples of 3 from 1 to 20:
def mult3(n):
    return (n%3) == 0

print filter(mult3, range(1,21))

# If you pass None as the "filter function" then filter() removes
# all the false values from a sequence.

# ---- reduce()"
# - The first arg is a function taking two arguments
# - The second arg is a sequence

# reduce() applies the function to the sequence in turn:
# - First, it applies it to the first two elements, and stores the result.
# - Then, it applies it to the previous reuslt and next element.
# - Once it runs out of elements, it returns the final result.
def add(a, b):
    return a+b
print reduce(add, [1,2,3])

# Python has a standard library module called "operator" which
# has a bunch of functions implementing the common expression operators as funcs.
import operator
print reduce(operator.add, [1,2,3])

# ----------------------- Functions without def --------------------------"
# Creating temporary functions, without using def or giving it a name
# can be useful in situations where a function is only used in one place.

# ---- Lambda functions"
# Anonymous functions are called Lambda functions.
# - Definition consists of the keyword lambda, a list of args, a colon, and expr.
# - A lambda function definition is an expression which returns a func object.

# The below two are roughly equivalent:
def add(a,b):
    return a + b

add = lambda a,b: a+b
# The second function object bound to the name "add" doesn't know its own name
# the first does.

# Squares example from above with lambda:
print map(lambda x: x*x, [1,2,3,4,5])

# ---------------------------- Lookup Tables -----------------------------"
# Can use lambda functions for simple lookup tables:
d = {
    "sqr": lambda x: x**2,
    "neg": lambda x: -x,
    "abs": abs,
    }
print d['sqr'](2)
print d['neg'](2)
print d['abs'](-2)

# ------------------------ Python Data Model -------------------------"
# Everything you can refer to is an object. 
# - Files
# - Functions
# - Exceptions
# - Modules
# - Numbers
# - Strings
# - Lists, etc

# an object stores its data along with information representing its type
# different object types have different capabilities:
# - Strings and lists have a concept of length, ints don't.
# - Functions and methods can be called, lists, ints, etc can't.

a = 1
print type(a) # int

# An objects type is also an object:
t = type(a)
print type(t)

# ------------------ Obejcts and Attributes ---------------------"
# Some types of objects have associated data known as attributes.
# - Attributes are named elements of an object or type.
# - They are referred to by the object's name, followed by a period
#   and the attribute name. I.e: foo.bar is the bar attribute of foo.
# - They can contain any Python object

# Examples of common attributes:
# - Object methods.
#    -- myfile.readline is the readline attribute of a file object
# - Functions / variables in a module
#   -- time.time is an attribute of the module object time

# --------------------------- Exceptions ------------------------------"
# An exception is a runtime error.
# Exceptions normally stop your program or command, and print an error.
# The error gives a trace of the execution stack, to aid debugging.
# Each type of exception has a name.

# Handling exceptions can be useful.

# ----------------------- Raising Exceptions ------------------------
# Can be used for signifying errors or unexpected conditions.
#raise NameError("Hi there")
# File "<stdnin>", line 1, in <module>
# NameError: Hi there

# ---------------------- Exception Handling ------------------------
# try:
#   statements
# except [exceptions(s)]:
# statements

try:
    1/0
except ZeroDivisionError:
    print "Sorry, your divisor was zero, try again."

# ---- Bare Raise Statement
# A bare raise statement re-raises the last exception.
try:
    1/0
except ZeroDivisionError:
    print "Sorry, your divisor was zero, try again."
    #raise

# ---------------------- Finally and Else ----------------------
# Extensions of try/except:
# - Finally - if you include a finally clause, any code in that block will always
#   be run once your try block is finish, even if an exception or return statement 
#   finishes it early.
# - Else - Is executed IF there is no exception raised in the try block.

try:
    1/0
except ZeroDivisionError:
    print "got the error, as expected!"
else:
    print "no error raise."
finally:
    print "Oh, and the finally clause too"



