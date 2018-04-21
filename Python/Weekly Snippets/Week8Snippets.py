#!/usr/bin/env python

# Jenna Afarian - S3511312
# Week 8 - Data Types

# ---------------------------- Lists vs Tuples ----------------------------
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

# --------------------- Common uses of tuples -----------------------
# often used for returning more than one value from a function.
# - Python functions return one value
# Can bundle a number of values into a tuple and return that
# Unpack the tuple to retrieve the individual values

def sumdiff(a, b):
    return (a+b, a-b)

a, b = sumdiff(5, 3)
print a
print b

# ------------------- String Formatting - the % Operator -------------------
# The % operator acts like the sprintf fucntion in C when applied to strings.
# - The string is a printf format strings
# - The right argument is a value, or a tuple of values.
# - The result is a string, with the formatting codes replaced with
#   formatted values.
answer = 42
print "The answer is %d."%answer
print "Half of %d is %d."%(answer, answer/2)

# Note: % will stringify any arguments if they are not already strings.

# ----------------- String Formatting and Dictionaries -----------------------
# The % can be used with a dictionary of named values, each formatting
# code has the key in brackets after the %. Field type must be specified
# after the brackets.
foo = dict(name="Paul", phone="0413-333-222", email="paul@email.com", age=33)
print """
Name: %(name)s   %(age)d years old
Telephone: %(phone)s
Email: %(email)s"""%foo

# ------------------------- String Methods -------------------------------
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

# ------------------------- More List Methods ---------------------------
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

# ---- stack
# A stack is last in, first out (LIFO).
stack = []
stack.append(3)
stack.append("blah")
stack.append(22.4)
stack.pop() #22.4
stack.pop() #"blah"

# ---- queue
# First in first out (FIFO) structure.
# l.sort() - sort the list in place.
