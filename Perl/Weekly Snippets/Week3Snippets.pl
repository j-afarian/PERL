#!/usr/bin/env perl

# ----------------- WEEK 3 -----------------
# This contains random snippets of code from 
# textbooks and learning modules

################# FILE HANDLING ######################
# -------------- OPEN / CLOSE --------------
# To open a file use <OPEN FILEHANDLE, EXPRESSION>
open (MYFILE, "Week2Snippets.pl");
# Often used with "or die"
open (AFILE, "Week2Snippets.pl") or die "Error opening file\n";

# Closing a file handle:
close MYFILE;

# ------------- READ -----------------
# Reading from a file:
open my $file, "TestText.txt" or die "File operation failed: $!\n";
my @contents = <$file>;
close $file;

foreach $line (@contents) {
   print "$line";
}

# Reading from a file line by line:
open my $file2, "TestText.txt" or die "File operation failed: $!\n";
while ($line2 = <$file2>) {
   chomp $line2;
   print "\"$line2\" contains doggo!\n" if $line2 =~ /doggo/;
}
close $file2;

# Hidden default variable $_:
open my $file3, "TestText.txt" or die "File operation failed: $!\n";
while (<$file3>) {
   chomp $_;
   print "\"$_\" contains kitty!\n" if $_ =~ /kitty/;
}

# -------------- WRITE ----------------
# Similar to printing to the screen.
# The '>' specifies the mode of opening the file, the file is created
# and ready for writing content. If it already exists it will be
# overwritten. To add new content to an existing file use append '>>'.
open my $file4, ">>TestText.txt" or die "File operation failed: $!\n";
print $file4 "Hello World\n";
close $file4;

# "<file.txt" opens in read mode, same as "file.txt"
# ">file.txt" opens in write mode
# ">>file.txt" opens in append mode
# "+>file.txt" opens in read and write mode
# "+>>file.txt" opens in read and append mode

# ------------ OPEN PROCESSES ---------------
# Can use a pipe | to read input or output from another process
# Below, the output from the UNIX command "ls -l" is read:
open my $file5, "ls -l|" or die "Cannot call ls\n";
while (<$file5>) {
   print;
}
close $file5;

# Calls UNIX command lpr, output sent to $printer will be 
# printed to printer "myprinter"
open my $printer, "|lpr -Pmyprinter" or die "Cannot invoke lpr\n";
print $printer "something to be printed\n";
close $printer;

# Place a series of processes in one pipe:
open my $filelist, "ls -l | grep pl | sort |" or die "Commands failed\n";
while (<$filelist>) {
   print;
}
close $filelist;

# -------------- OPEN DIRECTORIES ----------------
# Functions for opening and reading directories: opendir and readdir

# Read contents of 
opendir my $dir, "test" or die "Cannot open test directory\n";
my @files = readdir $dir;
close $dir;
foreach my $file (@files) {
   print "$file\n";
}

# Open current directory and return all *.pl files in alphabetical order
opendir my $dir2, "." or die "Cannot open the current directory\n";
my @files2 = sort grep /\.pl/, readdir $dir2;
foreach $file2 (@files2) {
   print "$file2\n";
}

# NOTE: Directory handles and file handles use different namespace

# ------------- ADDITIONAL FUNCTIONS -----------
# Perl provides related functions, some have the same name as their 
# counterpart UNIX command.
# - chdir to change the current working directory
# - chmod to change the mode of a file or list of files such as 0755
# - chown to change the owner of a file or list of files
# - glob to return a list of filenames (as in shell)

@files = glob("*.p;"); # return all files with extension ".pl"

# Glob can be used to handle shell identifiers such as ~
# Cannot open files with tilde in <open FH, "~/path"> because tilde
# is not recognized, must use glob.
open my $fh, (glob("~/.bashrc"))[0] or die "$1";

# Shortcut to invoke glob function:
@files = <*.pl>; # return all files with extension ".pl"
@allFiles = <*>; # return all files in the current directory

# - mkdir to create directory
# - rename to change name of file
# - rmdir to remove directory
# - stat to provide statistics for a file, returns 13-element array

my @statinfo = stat $Week2Snippets.pl;

# Locking a file
use Fcntl qw/:flock/;
open my $filehandle, ">outputfile" or die "Can't create the file\n";
flock($filehandle, LOCK_EX);
print $filehandle "I'm working on the railroad!\n";
close $filehandle;

# - LOCK_SH : Shared lock, allows readers
# - LOCK_EX : Exclusive lock, no access
# - LOCK_UN : Release the lock

# Locks are applied on filehandles, not the direct files.
# Does not guarantee locking, other processes may access if they
# do not respect the locks.


################### SUBROUTINES ######################
# Can define own functions, called subroutines (or functions / methods).
# Declare: <sub NAME BLOCK>

sub myMessage {
   print "I love chocolate\n";
}

# call with myMessage; or myMessage();
myMessage;

# Subroutine can be defined before or after the statements which call the routine.

# ------------------ PARAMETERS ------------------
# Subroutine params are passed as scalar values. Because of this, there is no
# need to specify the number of params when defining a subroutine.
# Param list passed in as a special variable, the special array: @_
#
# This subroutine sum calculates the total value of all parameters:
sub sum {
   my $total = 0;
   foreach my $i (@_) {
      $total += $i;
   }
   return $total;
}

print sum(10, 11, 12);
print "\n";

# Can pass arrays and variables to subroutines
@a = (1,2);
@b = (3,4);
print sum(@a, @b); # this returns 10 
print "\n";

# Can treat @_ as a normal array, eg $_[0] is the first element,
sub compare {
   return 1 if $_[0] > $_[1];
   return -1 if $_[0] < $_[1];
   return 0;
}

print compare(1,2); # prints -1
print "\n";
print compare(3,2); # prints 1
print "\n";

# Return the first parameter and ignore the rest.
# Shift function takes @_ as the default input array, meaning if there is
# no specified array it operates on @_
sub first {
   return shift;
}

@array = (a..d, 1..5);
print first @array; # prints a
print first 10, 8, 3, 5; # prints 10

# Return size of parameter list
# The @_ * 1 enforces a scalar context so the size of the array is returned.
# return @_ will return entire list because list context is assumed.
sub count {
   return @_ * 1;
}

print count @array; # prints 9
print count 10, 8, 3, 5; # prints 4

# -------------- RETURN VALUES ---------------
# Can return scalar values and entire lists. Multiple values can be
# returned with one subroutine call. Different to many other languages

sub firstLast {
   return shift, pop;
}
print firstLast @array; # prints a and 5
my ($first, $last) = firstLast @array; # assign to variables

# Cannot pass list into multiple arrays.
# my (@first, @last) = firstLast @array -> this is wrong

# Empty return passes an undefined value to the caller. Can be used to
# indicate unsuccessful subroutine call

sub divide {
   return unless $_[1];
   return $_[0]/$_[1];
}

print "Division failed\n" unless divide(1,2); #if second variable is 0, fails.

# Returning nothing is different with no returns!
# If there is no return statement, a subroutine returns the last value that has
# been evaluated.

sub sub1 {
   my $a = 100;
}

print sub1(@array); #returns 100

# Last evaluated value could also be a list.

# ------------- MUTABLE PARAMETERS --------------
# Parameters in Perl are passed as references, inside changes
# will affect the actual value of the variable.

sub absList {
   foreach my $i (@_) {
      $i = abs($i);
   }
}

@list = (-2, 2, 4, -4);
absList @list; # Now @list is 2, 2, 4, 4

# If you don't want to modify the original parameter, return a new list
sub absList2 {
   my @array;
   foreach my $i (@_) {
      push @array, abs($i);
   }
   return @array;
}

@list = (-2, 2, 4, -4);
@newlist = absList2 @list;
# @newlist is 2,2,4,4 @list remains -2,2,4,-4

# -------------- PROTOTYPES ------------------
# Can build perl subroutines similar to C or JAVA where there
# are requirements on the parameter list such as data type, amount.
sub addtwo ($$) {      # accept two scalar values
   my $first = shift;
   my $second = shift;

   return $first + $second;
}

$sum = addtwo(1,2);
#$sum = addtwo(1,2,3); # compilation error
@array = (1,2);
#addtwo(@array); # error, only two scalar values! No arrays

# func($) is scalar value, func(@) is list value, func($@) is scalar plus list.

# ---------- INLINING CONSTANT SUBROUTINES -----------
# Subroutines that are prototyped wtih empty parentheses take no params
# and can return constant values

#sub maxspeed () = { 300 };
#print "The maximum speed is ", maxspeed, "\n";.

######################### SPECIAL VARIABLES ############################
# -------------------- $_ -------------------
# Default variable, it is often hidden.
while (<>) {
   print;
   chomp;
   print "This line contains perl" if /perl/;
   my @array = split;
   foreach (@array) {
      print;
   }
}

# the above is equivalent to:
while ($_ = <>) {
   print $_;
   chomp $_;
   print "This line contains perl" if $- =~ /perl/;
   my @array = split " ", $_;
   foreach $_ (@array) {
      print $_;
   }
}

# Chomp removes trailing new line.
# Split splits a string into a list of substrings by a specified separator.
# If no separator is given, default " " space is used.

# There is only one $_ - acts like a variable to hold any temp values.
# Modifying the value will affect all functions on operators which read
# from it. 

# Some operators do not take $_ as default:
# ++; does not increase $_ by 1
# $_ ++; does increase $_ by 1

# Subroutine can take $_ as the default param.
print "\n";
sub keysearch {
   if(! @_) {
      return 1 if /key/;
      return 0;
   }

   foreach (@_) {
      return 1 if /key/;
   }
   
   return 0;
}

print keysearch, "\n";
print keyseach "my keys", "my value", "\n";

# --------------------- @_ --------------------
# Special array, it is global. Cannot define as "my" but can 'local'.
# Primarily used as the special array for passing params into subroutines.
# Inside a subroutine, the array is localized, original values not affected.
sub func {
   @_ = ("a" .. "e");
   return @_;
}

@_ = (1..5);
# -------------------- $" -----------------------
# List separator. Character/string specified in this variable is used
# as the list separator.
$" = ",";
print "@_\n"; # list separated by commas (1,2,3,4,5).
@array = func (8,9,10);
print "@_\n";

# @_ is the default input for some functions: shift, pop
# Function split returns substrings to @_ if no array specified.

# ------------------- @ARGV -------------------
# Special array of the command line arguments of the current script.
# If you run a script lke: >myscript.pl -x file1 file2
# then @ARGV contains 3 elements: ("-x", "file1", "file2")

die "Useage: $0 -x [file1] [file2]" unless @ARGV;

do { } if (shift @ARGV eq "-x");

foreach (@ARGV) {
   open FILE, $_ or die "File $_ does not exist";
   # do something
   close FILE;
}

# The above script terminates if no arguments are given.
# $0 is the name of the script
# Array @ARGV is ordinary, eg $ARGV[0] is the first element. 
# $#ARGV is the index of the last element.
#
# @ARGV is mutable, do not change its content unless you have a reason.
