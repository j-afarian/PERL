#!/usr/bin/env perl

# This file contains snippets of code from week 5
# course and textbook material

################# DATA STRUCTURES ##################
# ------------- DATA STACKS AND QUEUES --------------
# Stacks are based on Last-In-First-Out (LIFO).
# Queues are based on First-In-First-Out (FIFO).
#
# Stacks are like a can of tennis balls. The first ball you 
# put in is pushed to the bottom, the only one you can take out
# is the one on top "last-in".
#
# A queue is like a queue of passengers waiting in line,
# first come, first serve.
#
# A queue can be used to manage buffers. Data stored in buffers 
# earlier will be processed before data stored later.
#
# A stack can utilize nested function calls. The last function
# call is executed first, and returns to its caller to
# complete the caller function. The first function in a chain
# of functions is evaluated last.

# IMPORTANT: Perl arrays directly support stacks and queues. 

# -------------------- Stacks ---------------------
my $element = "example";
# Create
@stack = ();

# Insert (add element to front)
push @stack, $element;

# Remove (element from the back)
pop @stack;


# ------------------- Queues --------------------
# Create
@queue = ();

# Insert (add element to the queue)
push @queue, $element;

# Remove (element from the front)
shift @queue, $element;

# --------------- LINKED LISTS ------------------
# Linked lists are a non-linear data structure in which
# elements can be inserted or removed at any arbitrary position.
# Usually implemented as a collection of elements connected
# to each other by references.

# In perl, you can create an array as a linked list.

# Create
@list = (1, 2, 3, 4);

# Insert (in this case, after 2nd element)
splice @list, 2, 0, 2.5; #@list is now (1, 2, 2.5, 3, 4)

# Remove (in this case, fourth element)
split @list, 3, 1; #@list is now (1, 2, 2.5, 4)

# Conventional linked lists: Each element linked to it's
# predecessor by a reference. Last element has undef value
# as reference. 
#
# Each element is a 2-element array: first entry is the value 
# of that element, second contains the reference to next node


# Creation
my $entry1 = 1; my $entry2 = 2; my $entry3 = 3;

my $list = [$entry1, undef];      # create list - single element
$list = [$entry2, $list];         # Insertion of element at the head
$list = [$entry3, $list];         # Another insertion

# Traversal
my $pos = $list;

while (defined($pos)) {
   my $value = $$pos[0];
   print $value;            # Do something
   $pos = $pos->[1];        # Move to the next element
}

# Add element to the front
add ($list, 5);

sub add {
   $_[0] = [$_[1], $_[0]];
}

# The first arg of the subroutine is the reference of the first element,
# the second arg is the new element to be added.

# To remove element (specified value)
remove ($list, 2);

sub remove {
   my $pos = $_[0];
   my $value = $_[1];

   if ($pos->[0] == $value) {    # If it's the first element, assign
      $_[0] = $pos->[1];         # the head to the second element

      return 1;                  # Return success
   }

   while (defined($pos->[1])) {
      # If the next element contains that value, then..
      if ($pos->[1]->[0] == $value) {
         $pos->[1] = $pos->[1]->[1];  # Short-circuit it
         return 1;                    # and return success
      }

      $pos = $pos->[1];        # If not, move the current position
   }                           # to the next

   return;                     # return false
}


# ----------------- Double linked lists ------------------
# Requires an additional link so an element knows who is its
# predecessor, and the traversal can go in both directions.

my $list = [$entry1, undef, undef];

$list = [$entry2, $list, undef];     # Insert at start

if (defined($$list[1])) {
      $list->[1]->[2] = $list;       # Create reverse reference on the second node
}

$list = [$entry3, $list, undef];     # Insert the third element

if (defined($list->[1])) {
   $list->[1]->[2] = $list;          # Create reverse reference on third node
}

# -------------- Circular double linked lists --------------
# Same as linked lists, but with a reference back to the start.

my $list = [$entry1, undef, undef];

$list->[1] = $list;
$list->[2] = $list;

$list = [$entry2, $list, undef];    # Insert the second element
$list->[2] = $list->[1]->[2];
$list->[1]->[2] = $list;
$list->[2]->[1] = $list;

$list = [$entry3, $list, undef];    # Insert the third element
$list->[2] = $list->[1]->[2];
$list->[1]->[2] = $list;
$list->[2]->[1] = $list;

# -------------------- Binary Trees ----------------------
# Multi-dimensional data structures. File system is a typical
# example of a tree-shaped structure, where the top directory is the
# root of the tree, and sub-directories are branches on the tree.
#
# A binary tree is a tree which has only two successor nodes on each
# internal node in the tree. Can be used to perform search.
#
# Can use arrays to implement a binary tree [element, left, right].
# Second element of each array is its left branch, third is right.

my $root = [$element1, undef, undef];
$root->[1] = [$element2, undef, undef]; # add to the left
$root->[2] = [$element3, undef, undef]; # add to the right

# Using hashes to implement binary trees

my $btree = {element => $element1};
$btree->{"left"} = {element => $element2};  # add to the left
$btree->{"right"} = {element => $element3}; # add to the right

# Using array indices to differentiate left child and right child
# elements can be confusing. Instead use anon hashes to implement
# a bibary tree, so branches can be referred to by keys "left" and "right".
#
# Can be used on linked lists as well, us "next" and "prev" to refer to elements
#
# Large binary trees, hashes can take up a lot more memory vs array based.


# BINARY TREE TRAVERSAL
# The following three subroutines implement post-order, pre-order and in-order
# binary tree traversals. The variable $funref is the reference to a function
# which processes the current note, such as print out the value, push value
# into an array, etc.
#
# Recursive function call is used here, subroutine calls itself (a clone of itself).

# -- Post-Order Traversal --
sub btreeTravPost {
   my $btreeref = shift;
   my $funcref = shift;

   return undef unless $btreeref;
   return undef unless $funcref;

   if (defined($btreeref->{'left'})) {
      btreeTravPost($btreeref->{'left'}, $funcref);
   }
   if (defined($btreeref->{'right'})) {
      btreeTravPost($btreeref->{'right'}, $funcref);
   }
   $funref->($btreeref->{'element'});
}

# -- Pre-Order Traversal --
sub btreeTravPre {
   my $btreeref = shift;
   my $funcref = shift;

   return undef unless $btreeref;
   return undef unless $funcref;

   $funcref->($btreeref->{'element'});

   if (defined($btreeref->{'left'})) {
      btreeTravPre($btreeref->{'left'}, $funcref);
   }
   if (defined($btreeref->{'right'})) {
      btreeTravPre($btreeref->{'right'}, $funcref);
   }
}

# -- In-Order Traversal --
sub btreeTravIn {
   my $btreeref = shift;
   my $funcref = shift;

   return undef unless $btreeref;
   return undef unless $funcref;

   if (defined($btreeref->{'left'})) {
      btreeTravIn($btreeref->{'left'}, $funcref);
   }

   $funcref->($btreeref->{'element'});

   if (defined($btreeref->{'right'})) {
      btreeTravIn($btreeref->{'right'}, $funcref);
   }
}


######################### ERROR HANDLING #######################
# Handle errors by:
# 1) Condition checking to produce error or warning message
# 2) Using the eval function

# -------------------- Warn and Die ---------------------
# Inbuilt functions to send error messages to the screen such as die, and warn.
# Die function exits the program and produces a message.
# Warn function does not terminate program or throw exceptions, but sends msg.
my $bug = 1; my $denom = 0;

warn "This is a warning!" if $bug;
warn "This is another warning\n" unless $nobug;

# Above are not the same. Without a trailing newline, the filename and line number
# will be automatically appended. The "\n" stops this info from being included.
# Newline does the same with 'die'.

# Both die and warn support special toeksn __FILE__ and __LINE__ which are
# the current name and line number.

# die "Errors in ", __FILE__, ", line ", __LINE__, " !\n" if $bug;

# Can be usedfule to include $! in warn or die statements, this gives a string
# representation of the last error.

#open(FIN, "input.csv") or die "Couldn't open input file. Error was $!\n";

# ----------------- Eval: Exception Handing ----------------
# Simple way to set up an exception handling block. Similar to try..catch.
# Can serve a number of purposes:
# - As a "try and catch" exception block
# - As a means to generate code at runtime
#       - Determining a module to call at runtime: eval "use $module"
#       - Ensuring that code will not cause termination of the running process
#
# Syntax can be one of the folowing:
#     eval BLOCK
#     eval EXPR
#     eval
#
# -- eval BLOCK --
# Evaluates statements in the block and catches any possible run-time errors
# even if these errors are fatal and could term the program. A die statement 
# inside the block will not terminate the process.
eval {
   die "Denominantor is zero!\n" if ($denom == 0);
};

print "I am still here
\$\@ ===> $@";

# The eval EXPR form compiles and executes code on the fly, and catches any
# possible run-time errors. More general, but slower due to parsing/compliation
# process. If no parameter is provided, it evaluates $_.

# -- CATCHING EXCEPTIONS --
# Error messages are saved in special variable $@ by the eval function.
# If no error, then $@ is set to null string "". Can test existence of an exception:
eval {
   $number = 2/0;
};

if ($@) {
   print "ERROR: $@ \n";
}

# eval function returns the last expression evaluated.
# If there is an exception, it returns undef.
my $part = 100;
my $total = 0;
$percentage = eval{$part/$total};
print "$percentage" if $percentage;
warn $@ if $@;

# -- EVALUATING EXPRESSIONS --
# Eval function can execute and evaluate any Perl expressions.
# This can be used to include new statements on the fly.
#
# Load modules:
#my $argh = "Net::FTP";
#eval "use $argh";
#print "Unable to load the module. $@\n" if $@;

# Evaluate other expressions:
my $scalar = "Hurrah to the Camel!";
eval "print \$scalar x 40"; # Hurrah 40 times!
print "\n";

# Implement a small interactive mode:
#while(<>) {
#   eval;
#   warn $@ if $@;
#}

# When evaluating expressiong, eval function is usually used in form of
# eval EXPR rather than eval BLOCK.
# The former complies the exression during execution, the latter is probably
# not what you intended:

#eval {$total == };   # compilation error
# Above has compilation error, kill execution, nothing saved in $@

#eval "$total == ";   # Correct
# Compiles "$total ==", passes syntax error into $@, execution not aborted.


######################### MODULES #########################
# Equivalent to libraries/packages in other languages.
# Syntax: 'use <module name>' or 'require <module name>'
# Use is preferred as it loads modules during compilation and reports errors
# sooner, whereas require loads code from files specified in the arg list.
#
# Two groups of Perl modules: Pragmatic Modules and Standard Modules.
#
# Pragmatic:
#   - Affect compilation process.
#   - Add-on language features
#   - Eg: use strict, use warnings, use locale, use overload
#   - Active only to statements after the 'use' and inside same innermost block.
#
# Standard:
#   - Provide extra functionality
#   - extend datatypes
#   - process strings 
#   - process command lines
#   - provide x-platform methods of handling files, directories, i/o
#   - interface to OS's
#   - provide networking and interprocess communication
#   - support WWW apps
#   - manage databases
#   - provide security mechanisms
#   - support perl classes
#   - give warnings / handle exceptions
#   - support docs
#   - help other modules
#   - support Microsoft Win32 environment
#   - and more

# ------------------- use strict ----------------------
# Changes the rules about what is/isn't legal. A good way of enforcing
# code standard, it is recommended. Highlights a large number of problems
# before they become problems.

# three components, if none specified it loads all:
# use strict "vars", "refs', "subs"
# variables, references, barewords
#
# Strict variables need to declare our, my.
#
# Strict references can only be "hard", not symbolic.
#
# Strict subs, barewords are syntax errors. Subroutine needs to be 
# declared before the subroutine call, or used with parentheses. Otherwise
# the function name is treated as a bareword.

#$SIG{'INT'} = \&handler;     # correct
#$SIG{'INT'} = handler;       # incorrect, bareword

# %SIG is another special variable which is used to handle signals for
# interprocess communications.

# ----------------------- no -----------------------------
# To temporarily disable a module, use function 'no'. Only affects
# innermost block. Most standard modules do not support no, but pragmatic
# modules are more cooperative.

use warnings;       # warnings enabled
{
   no warnings;     # warnings disabled
}
# something         # warnings enabled

# ---------------------- Common Modules -----------------------
# - Net::*         Networking modules
# - CGI            Common Gateway Interface modules
# - DBI & DBD      Database Access modules
# - MIME
# - Tk             Graphical toolkit


##################### NETWORKING MODULES ########################
# Net::* family of modules support various networking services:
# FTP, POP3, SMTP.

#### VIEW ADDITIONAL MODULE SCRIPTS IN /Week5Extras FOLDER ###

# ------------------------ FTP ---------------------------
# Typical FTP functions available in the module:
# ftp->login("username", "password") - Logs in
# ftp->cwd($dir) - Change directory
# ftp->dir();
# ftp->put($file) - Uploads the file with the filename $file
# ftp->delete($file) - Deletes the $file off the server
# ftp->pwd() - Returns the current working directory
# ftp->mkdir($dir) and ftp->rmdir($dir) - Creates and removes directories
# ftp->mtdm($file) and ftp->size(4file) - Returns modification time and size for file

# ------------------------- POP3 --------------------------
# Net:POP3 - retreives emails from a mail server.

# $pop->delete($msgnum) - Delete messages off the server
# $pop->last() - Returns the MSGNUM of the last message
# $pop->get($msgnum, FH) - Prints the message straight to a filehandle
# $pop->list() - A hash reference, each element is one message. Key is message number, value is size of msg.
# $pop->get($msgnum) - Returns the reference to the message MSGNUM. Message can be read as an array.
#                      with each element being one line.

# -------------------------- SMTP -------------------------
# Net::SMTP - implements client side for sending emails.
# It is preferred to use the MIME or MAIL module for sending mails, they provide
# more high-level functionalities.

# ---------------------- MIME -----------------------------
# Designed for MIME (Multipurpose Internet Mail Extensions) messages.
# Supports: Text other than ASCII, non-text attachments, message bodies with multiple parts,
# header information in non-ASCII character sets.
#
# MIME has no direct mail sending capabilities, relies on "sendmail" or other mail
# transport agents.

# ------------------------ CGI -----------------------------
# use CGI qw/:standard/
# Tells the interpreter to use the "standard" options. Includes CGI support,
# support for all HTML standards, and the forms handler.
#
# - header() handles HTTP header. Can add in anything that's a valid HTTP header.
# - start_html and end_html handles the start of the HTML and end of HTML text.
# - Any function not handled by existing functions is checked to see whether there
#   is a HTML tag named after it.

use CGI qw/:standard/;
print header;
print start_html("List CGI vars");
print h1("CGI Vars");

foreach (param()) {
   print p("$_ is " . param($_));
}

print end_html;
print "\n";

# param() returns list of parameter names, param(<name>) Returns the value.
# See example in Week5Extras folder.

# --------------------- Other Commonly Used Modules ----------------------------
# DBI and DBD for Database Access
# General purpose access to DB servers.

use DBI;

foreach (DBI->available_drivers()) {
   print $_;
   print "\n";
}

my $dbi = DBI->connect("dbi:Sponge:dbhost:dbname", "user", "password");
die "Unable to connect.\n" unless $dbi;

# ------ Sending Queries ------
# Sent with the prepare and execute functions.
# - Prepare parses the SQL statement and returns failure if there is an error.
# - Execute runs the query and returns failure if unable to run.

#my $query =$dbi->prepare("SELECT * FROM Phone");

#$query->execute();

#my $ref;

#while ($ref = $query->fetchrow_hasref) {
#   foreach (sort keys %{$ref}) {
#      print "$_ -> ${$ref}{$_}\n";
#   }
#}

# Data retrieved from the database is returned as a table.
# The fetchrow_hashref reads the table row by row.
# For each row, it receives a hash reference for that row. Each key is
# the field name and the value is the data in that field.


# ------ TK - Graphical Toolkit -------
# GUI's are supporte in PERL via external modules. Common one is Tk.
#
# Simple Hello World with Tk:
use Tk;

my $main = MainWindow->new;

$main->title("Hellow World");

$main->Button(-text => "done",
   -command => sub{exit;})->pack;

MainLoop;

# Other graphical modules that might be useful:
# - Gtk   Gnome Graphical Toolkit. Graphically intensive, supports Perl, C, Python.
# - Qt    KDE Graphical Toolkit. Supports Perl, Python, C, C++.
# - GD    A graphics library, support drawing color images such as PNGs and GIFs.
