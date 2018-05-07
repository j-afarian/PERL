#!/usr/bin/env python

# Week 9 snippets of code from text books and material.

# ----------------- OBJECT-ORIENT PROGRAMMING ----------------------
# A programming paradigm in which data and code are encapsulated into objects.
# - an object has data, and methods which act on its data.
# - a method is like a function, only aware of its own object.

# Popular OO languages are C++, Java, C#.

# Python has OO features:
# - everything is an object
# - built-in python types with methods (files, lists)
# - it's possible to define your own object classes in python.

# ------------------ Class vs Instance ----------------------
# Classes define behavious of their instance objects. 
# Instances hold data associated with that behaviour.

# Because classes are objects, we refer to instance objects as just instances.

# Built-in data types are all classes (also called types).
# eg: int is a class, int objects you create are instances of the int class.
# - a class can be thought of as the type of instance object.

# -------------------- Defining classes in Python -----------------------
# done with the class statement, followed by an indented block.
class classname(object):
    def method1(self, args):
        print args
    def method2(self, args):
        print args
class_attribute1 = 'value'

# Classes and their methods may have documentation strings.
# The first indented string within a class or method is the docstring.

# ----------------------- Creating Instances ----------------------------
# An instance of a class is created by calling the class as if it were
# a function.
class myclass(object):
    pass

anobject = myclass()
anotherone = myclass()

# ---------------------------- Methods ------------------------------
# Methods are functions declared in a class definition.
class hello(object):
    def hi(self):
        print 'hi!'

obj = hello()
obj.hi()  # hi!

# Methods are defined as functions within the class definition
# The first arg of any method is the "self" argument.
# When a method is called, the instance for which it was called is
# passed as the "self" argument.

# Self is equivalent to this in Java, and C++. In Python it is passed as an arg.

# ----------------------- Instance Variables --------------------------
# Data belonging to an instance object - referred to as attributes of the instance.
# - Instance variables are not part of the class definition.
# - They are created when they are set on the instance.
class example(object):
    def setValue(self, v):
        self.value = v
    def getValue(self):
        return self.value

myobj = example()
myobj.setValue("foo")
print myobj.getValue()

# We can set instance variables outside of the class definition.
# self.value assigns an attribute to the self object. If we have that 
# object bound to another variable then this is possible:

myobj = example()
myobj.value = "bar"
print myobj.value
print myobj.getValue()

# ---------------------- Class Attributes -------------------------

