#!/usr/bin/env perl

# Snippets of code from the week 6 lectures and text books.

################### Object-Oriented Programming ####################
# Perl is primarily structured, but does support OO-programming, but 
# there is no OO specific syntax.
#
# - A class in Perl is simply a package. The variable inside of the
#   package can be considered global data of the class.
#
# - An object is actually a reference to a package.
#
# - Object methods are nothing but subroutines defined in the package.
#
# A perl "class" is a perl package which is defined as  a .pm file.
# A package is a new namespace within perl. A subroutine inside of 
# a package might have the same name as the reserved word, such as y 
# and join. Modules such as NET::FTP and DBI are examples of class/packages.
#
# ------------------- Methods/Subroutines ---------------------
# Defining methods for classes is the same as a normal subroutine.
#
# Some special method names:
#
# - new: Often used to create a new object, as the constructor.
#   Can be named anything (build, clone, spawn, create) as long
#   as it is "blessed".
#
# - destroy: Like a destructor, automatically called "at the right 
#   moment". Perl does garbage collection, an object which has no reference
#   referring to it will be implicitly removed from memory.
#   Destructor is not usually necessary.
#
# ------------------ Writing Your Own Package ------------------
# Often kept in separate repo to the scripts, but can be in same location.
# Conventions:
# - Filename has extension .pm
# - Packages start with the line package name;
# - Packages should have a variable $VERSION, which outlines version of code.
#   This is used by require for version dependencies
# - Ends with 1.

# A simple package - trivial.pl
#
# See Week6Extras Folder

use trivial;

$obj1 = new trivial;
$obj2 = trivial->new;

$obj1->printmsg;
printmsg $obj2;

