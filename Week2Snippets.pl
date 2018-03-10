#!/usr/bin/env perl

# ------------------ WEEK TWO --------------------
# This file contains random snippets of code from text books and learning modules

#################### ARRAYS #####################
# if an array is assigned to a scalar variable, the size of the array is passed 
my @array = ("a", "b", "c");
my $a = @array;
print "the size of \@array is $a.\n"; # $a is 3

# force scalar context explicitly
my @array1 = (1, 2, 3);
print "the size of \@array1 is ", scalar(@array1), ".\n";


# five built-in array processing functions
# ------------ POP -------------
# removes the last elements from the array and returns that element
# if empty, returns undef
my @array2 = (1, 2, 3, 4);
my $b = pop @array2;
# $b is 4, @array2 is 1,2,3.
print "\$b is $b\n";

# ----------- PUSH -----------
# adds list onto the end of an array, returns new array size
my @array3 = (1, 2, 3, 4);
my $c = push @array3, 5 .. 8;
# $c is 8, @array3 is 1,2,3,4,5,6,7,8.
print "\$c is $c\n";

# ---------- SHIFT ----------
# similar to pop, removes first element rather than last
my @array4 = (1, 2, 3, 4);
my $d = shift @array4;
# $d is 1, @array4 is 2,3,4.
print "\$d is $d\n";

# --------- UNSHIFT ----------
# similar to push, attaches list to front of array
my @array5 = (1, 2, 3, 4);
my $e = unshift @array5, 0;
# $e is 5, @array5 is 0,1,2,3,4.
print "\$e is $e\n";

# --------- SPLICE ----------
# replaces a slice of an array, format: splice ARRAY, OFFSET, LENGTH, LIST
# starts at position OFFSET. In list context it returns sub-array, in 
# scalar context it returns the last element removed
my @array6 = (1, 2, 3, 4, 5);
my @a = splice @array6, 2, 2, 9, 9, 9;
# starts from the third, removes two, and replaces with 9, 9, 9.
# @a is 3,4, @array6 is 1,2,9,9,9,5.
print "\@a is @a\n";

my $f = splice @array6, 2, 3;
# starts from the third and removes three, no replacement.
# $f is 9, @array6 is 1,2,5.
print "\$f is $f\n";

$f = splice @array6, -2;
# starts from the second last, removes everything after.
# $f is 5, @array6 is 1.
print "\$f is $f\n";

$f = splice @array6;
# removes everything. $f is 1, @array6 is ().
print "\$f is $f\n";

# pop, push, shift, and unshift all have splice equivalents
# push(@a, $x, $y)    = splice(@a, @a, 0, $x, $y)
# pop(@a)             = splice(@a, -1)
# shift(@a)           = splice(@a, 0, 1)
# unshift(@a, $x, $y) = splice(@a, 0, 0, $x, $y)


################### HASHES ###################
# Associative arrays or dictionaries, hases associate a keyword with a value
# Keys must be unique, but values can be duplicated. Keys can be associated
# with an empty value. Keys are strings, values are scalar context only (no lists, hashes or arrays).

# a hash is references with %.
my %hash;
# add keypair values:
$hash{"Bill"} = "Perl Programmer";
$hash{"Tom"} = "Python Programmer";
$hash{"Linda"} = "Python Programmer";
$hash{"George"} = "";

# if someone is a perl and python programmer separate with "and" not comma.
$hash{"Paul"} = "Perl Programmer and Python Programmer";

# test hash
if ($hash{"Bill"} =~ /Perl/) {
   print "A Perl programmer\n";
}

$value = $hash{"Linda"};
$value2 = $hash{"Paul"};

print "$value\n"; #Python Programmer
print "$value2\n"; #Perl Programmer and Python Programmer

# you can initialize a hash using a list
%examResults = ("Darcy", 60, "Jane", 89, "Frank", 76);

# a more readable version:
# The => operator forces the left side into a string literal, so no quotes needed.
%testResults = (Darcy => 60,
   Jane => 89,
   Frank => 76);

# five built-in hash processing functions
# ---------------- KEYS ----------------
# Returns a list of all the keys in a hash, used to iterate through
# sort for alphabetical
foreach my $key (sort keys %examResults) {
   print "$key\n";
}

# -------------- EACH ----------------
# Operates in list context and returns a pair of key and value at a time
while (my($key, $value) = each %examResults) {
   print "$key = $value\n";
}

# ------------- DELETE ---------------
# Deletes one element of the hash.
delete $examResults{"Jane"};
foreach $key (keys %examResults) {
   print "$key\n";
}

# Delete or empty entire hash:
%examResults = ();    # empty
undef %examResults;    # undefine

# ------------ VALUES --------------
# Similar to keys, returns a list of all the values
foreach my $val (values %testResults) {
   print "$val\n";
}

# ------------ EXISTS -------------
# Tests whether specified key exists in the hash
# Note: an existing key is different from a true value or defined value.
$trueValue =  $testResults{"Jane"};
$defined =  defined $testResults{"Jane"};
$exists = exists $testResults{"Jane"};
print "$trueValue\n"; # 89
print "$defined\n";   # 1
print "$exists\n";    # 1

