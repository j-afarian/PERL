#!/usr/bin/env perl

# --------------- Week 4 ---------------
# This file contains snippets of code from
# learning modules and text books.

############### REGULAR EXPRESSIONS ###############
###################################################
#
# ############### PATTERN MATCHING ################
# The basic syntax of pattern matching is: /pattern/
# Patterns can be bound to another expression using the
# binding operators =~ and !~ (contains, does not contain).
# If no operator, matching is performed on $_

$_ = "Larry has a little camel, little camel, little camel.";
print "Camel!\n" if $_ =~ /camel/;

# is equivalent to

$_ = "Larry has a little camel, little camel, little camel.";
print "Camel!\n" if /camel/;

# (Note: not recmomended to assign values to $_, many operations
# overwrite $_ and is used here for demonstration only).

# If the pattern is empty, the previous pattern is used:
$_ = "Larry has a little camel, little camel, little camel.";
print "Camel!\n" if /camel/;
print "Camel!\n" if $var =~ //;

# ----------------- SUBSTITUTION -----------------
# The basic syntax is: s/pattern/replacement/
my $larry = "Larry has a little camel, little camel, little camel.";
$larry =~ s/camel/lamb/;
print "$larry\n"; 

# Larry now has a little lamb, but only the first one is replaced.
# To replace all, use the global flag:
$larry =~ s/camel/lamb/g;
print "$larry\n";

# Substitution returns number of successful replacements.
# If none, empty string is returned.

# If the replacement is empty, those matches are removed:
$larry =~ s/little\ //g;
print "$larry\n";

# ---------- STORING RESULTS ELSEWHERE -----------
# Substitution modifies the string, but can store it elsewhere.
my $noChange = "Larry has a little camel, little camel, little camel.";
(my $new = $noChange) =~ s/camel/lamb/g;

# Parenthese give the assignment higher precedence. Without them, $new will 
# be the number 3 - the number of replacements.
my $new = $noChange =~ s/camel/lamb/g; # $new is "3" here, not $noChange

# Using a foreach loop on an array to substitute
my @names = qw(camel1, camel2, camel3);
foreach (@names) {s/camel/Camel/;}

# Another way to uppercase the first letter in the search pattern:
foreach (@names) {s/camel/\u$&/;}

# Apply multiple substitutions to a single variable:
my $var = "Larry has a little camel, little camel, little camel.";
for ($var) {   #for and foreach can be used interchangeably
   s/Larry/Mary/;
   s/has/had/;
   s/camel/lamb/g;
}

print "$var\n";

# --------- SOME MORE ADVANCED PATTERN MATCHING --------
# Multiply all the numbers in a string by 3. Assumes string starts
# with DATA and all numbers are separated by spaces:
$_ = "DATA 1 2 3 4";

my @array = split if /^DATA/; # split the string if it starts with DATA

for (@array) {
   s/\d+/$&*3/e if !/DATA/; # multiply the number in local $_ by 3/
}

print; # first print
$_ = join " ", @array; # join the array as a string
print; # second print

# NOTES: The split function splits a string into a list of substrings
# default separator if no pattern is given is whitespace.
# Works on $_ if no expression is given.
# split /pattern/, expression;
#
# Join function does the opposite, and joins an array as a string
# with a field separator.
# join /pattern/, expression;
#
# $_ inside the loop is localize. Outside the loop $_ = DATA 1 2 3 4
# Inside the loop, it contains each element of the array.
# The $_ outside the loop remains unchanged after this process as shown
# in the first print.

# Can do the same as the above with:
$_ = "DATA 1 2 3 4";
s/\d+/$&*3/ge if /^DATA/;
print;

##################### TRANSLATION #######################
# Basic syntax is tr/<search list>/<replacement list>/
# Translation operator scans through the string bound by =~,
# or $_, or character by character, and replaces a character in
# the search with that in the replacement list.
$_ = "Larry has a little camel, little camel, little camel.";
tr/ca/CA/;
print;
# Now $_ contains "LArry hAs A little CAmel, little CAmel, little CAmel."
# Translation operator returns number of occurences in search list. Can
# be used for counting set of characters
$_ = "Larry has a little camel, little camel, little camel.";
my $count = tr/ca//; #number of 'c' and 'a'
print "\n$count\n";

# ----------- PATTERN STRINGS AND DELIMITERS -----------
# Search and replacement patterns are string literals. 
# They can interpolate variables.
$_ = "Larry has a little camel, little camel, little camel.";
my $pattern = "camel";
my $replace = "lamb";
print "Camel!\n" if /$pattern/;
s/$pattern/$replace/g;
print "$_\n";

# To define pattern containing one variable immediate before 
# something, use {}.
$_ = "Larry has a little camel, little camel, little camel.";
my $pattern = "came";
print "Camel!\n" if /${pattern}l/; #search for camel

# Patterns are one kind of quoted constructs, which all have
# a generic "slash" form other than the well known versions such as ""
# for a string and () for a list.

#################################################################
# CUSTOMARY | GENERIC | MEANING                 | Interpolates? #
# ------------------------------------------------------------- #
# ''        | q//     | literal string          | No            #
# ""        | qq//    | literal string          | Yes           #
# ()        | qw//    | word list               | No            #
# //        | m//     | pattern match           | Yes           #
# s///      | s///    | pattern substitution    | Yes           #
# y///      | tr///   | character substitution  | No            #
# ``        | qx//    | command execution       | Yes           #
#################################################################


####################### MODIFIERS #########################
# Matching, substitution, and translation support modifiers
# at the end. This modifies the behaviour of the regex.

# ------------------- PATTERN MATCHING --------------------
# /i to ignore cases
# /g to match globally
# /x to ignore whitespace and permit comment (to improve legibility)
# /m to search a string as multiple lines if there are newlines embedded
# /s opposite of /m and treats newline as a character

$_ = "Larry has a little Camel, little cAMel, little camEL.";
my @patterns = /camel/gi;
# array @patterns has 3 elements: Camel, cAMel, and camEL.
print "@patterns\n";

# -------------------- SUBSTITUTION ------------------------
# Pattern matching modifiers above are also applicable for substitution
# /e to evaluate the replacement as a bock of perl code and use its
# return value to substitute the patter
my $lamb = 5;
my $llama = 10;
$_ = "Larry has a little Camel, little cAMel, little camEL.";
s{ c a m e l # Are you sure?}{ $lamb > $llama ? lamb : llama }gxie;
# If a lamb is worth more, then replace camels with lambs.
# Otherwise, replace with lalamas.
print "$_\n";

# --------------------- TRANSLATION ----------------------
# /d to delete found but un-replaced characters
$_ = "Larry has a little camel, little camel, little camel.";
tr/camel/x/d;
# All the 'a', 'm', 'e', 'l' are removed. The 'c' are replaced with 'x'.
# You can use tr/@$%*#//d to remove these special chars.

# /s to squash duplicate replaced characters
$_ = "Larry has a little camel, little camel, little camel.";
tr/rt/x/s;
# Now $_ is "Laxy has a lixle camel, lixel camel, lixel camel"


####################### META-CHARACTERS ########################
# \ | ( ) [ { ^ $ * + ? .
#
# \ - Escape character, disables other meta-characters.

# | - Alternation characte: Search for 'lamb' or 'llama'
#if /lamb|llama/;

# () - Groups sub-patterns as one unit: Search for 'lamb' or 'lamp'
#if /lam(b|p)/;

# [] - Defines a character class to match one character from the set
#if /lam[bp]/; # Search for 'lamb' or 'lamp'

# ^ inside [] is negation: anything but lamb/lamp
#if /lam[^bp]/; # lamc, lama, lamdd - just not lamb/lamp

# ^ and $ define the beginning and end of the string
#if /^Larry/; # string must start with 'Larry'
#if /lamb$/; # string must end with 'lamb'

# . (dot) matches with any character
$_ = " "; print "True\n" if //;    #true
$_ = " "; print "True\n" if /./;   #true
$_ = " "; print "True\n" if /\./;  #false
$_ = " "; print "True\n" if /./;   #false

# --------------- META-CHARACTERS AS QUANTIFIERS --------------
# Quantifiers specify the number of matches.
#
# * match 0 or more times
# ? match 0 or 1 time
# + match 1 or more times
# {x} match exactly x times
# {min, } match at least min times
# {min, max} match at least min times but no more than max times

# Special regex variables are
# $` the substring before the match
# $& the matched substring
# $' the substring after the match

$_ = "Larry has a little little little camel";
print "--$`--$&--$'--\n" if / (little )+/;
# --Larry has a-- little little little --camel--
# Pattern was matched 3 times

print "--$`--$&--$'--\n" if / (little ){2}/;
# --Larry as a-- little little --little camel--

# Quantifiers are greedy and will try to match the maximum
# possible. If using {1,3} and there are 3+ if will match 3.

# ----------------- LIMITING PATTERN MATCHES ----------------
# To match patterns as few as possible, use the minimal quantifiers
# *? 0 or more
# ?? 0 or 1
# +? 1 or more
# {x}? exactly x
# {min, }? at least min
# {min, max}? at least min but no more than max

$_ = "Larry has a little little little lamb";
print "--$`--$&--$'--\n" if / (little ){1,3}?/;
# matches only 1, NOT 3.

$_ = "Larry has a big big big pupper";
print "--$`--$&--$'--\n" if /.*?/;

# ----------------------- META SYMBOLS ----------------------
# \d any digit character, equiv to [0-9]
# \D any non-digit character, equiv to [^0-9]
# \s any whitespace character, equiv to [ \t\n\r\f]
# \S any non-whitespace character, equiv to [^ \t\n\r\f]
# \w any 'word' character, equiv to [a-zA-Z0-9_]
# \W opposite to \w
# \b matches word boundary, eg: /\blam\b/i matches with lam but not blame, not lamb.
# \B opposite to \b, eg: /\Blam\B/i matches with llama but not lama, not slam.

# ----------------------- SUB PATTERNS ---------------------
# Parentheses can be used to group units inside of a pattern.
# If the string matches with any of these sub-patterns, then matched
# substrings are stored in a set of special variables.
# $1 for first parenthesis, $2 for second pair, so on

$_ = "Larry has a little little little turtle";
my ($who, $what) = /^(\w+).*(\b\w+)$/;
print "$who has $what.\n";

# (\w+) matches with Larry and stored in $1,
# (\b\w+) matches with turtle stored in $2

$_ = "Will Jackson,987767";
s/(\D+),(\d+)/$2,$1/;
print "$_\n";

# Inside the pattern, the sub-pattern matches can be referred to
# as \1, \2, \3 etc.

$_ = "Larry has a little little little pony";
print qq/Found repeating word "$1"\n/ if /(\w+) \1/;

####################### FORMATS ########################
########################################################

# Informational only, not assessable

#printf and sprintf provide more formatting controls.
$course = "Java 1";
$pass = 74;
$total = 92;
$_ = sprintf "Pass rate of %s is %.2f\%\n", $course, $pass/$total * 100;
print;

# Another pre-formatted string method is "here-document"
$student = "Jack Smith";
$mark = 90;

print<<EOF;
Student Name: $student
Mark: $mark
EOF

# Formats can control output layout and keep track of number
# of lines, page number, page headers etc.
# FORMAT: to declare a format
# WRITE: ouput using the defined format

# -------------------- DECLARATION --------------------
# Basic syntax of a format declaration is:
format FORMATNAME = 
<body>
.

# If there is no name, then the format will be applied
# to STDOUT which is the default.
# The body can contain:
# - Picture lines: each one defines the format for one line
# - Arguement lines: each supplies values to the picture line above
# - Comments: start with #

# values to be supplied are marked with @ or ^. They are subsitutions.
format =
Price: $@<<<< Quantity: @ units
$price, $quantity
.

($price, $quantity) = (150, 3);
#write;

# Each format can have a TOP defined which is a header,
# automatically included when you use the format:
# FORMATNAME_TOP

# --------------- SUBSTITUTION FIELDS -----------------
# @<<<< defines 5 char left aligned field (@ counts as 1 char).
# @||| defines a 4 char center aligned field.
# @>> defines a 3 char right aligned field.
# @#.## the numeric value will display in a 5 character field
# with 2 digits after the decimal point.

my ($price, $quantity);

open my $file, "data.txt" or die "Invalid File";

$~ = "TABLE";         # use format TABLE
$^ = "TABLE_TOP";    # header


while(<$file>) {
   ($price, $quantity) = split;
   write;
}

format TABLE_TOP =
Item | Price | Quantity | Total
-------------------------------
.

format TABLE = 
@>>> | @|||| | @<<<<<<< | @###.##
$., $price, $quantity, $price * $quantity
.

# $~ is the current format in use
# $^ is the current format header
# $. is the current number in the most recent filehandle

# ------------------- CARETS ------------------------
# Carets (^) are similar to @ for field filling, but are substituted
# with a scalar variable, not an arbitrary expression.
# It reads and modifies the variable - characters filled in the
# substitution field is removed from the variable
format STDOUT = 
^|||||||||||
$a
.

$~ = "STDOUT";
$^ = "STDOUT_TOP";

$a = "I'm a little teapot short and stout";
write; # "I'm a little"
print $a; # "teapot short and stout"

# Shrinking is useful for printing a long string over multiple lines.
