#!/usr/bin/env perl

##################################################################
#                  Part A: Text File Comparer                    #
##################################################################
#                    Author: Jenna Afarian                       #
#----------------------------------------------------------------#
#                    Student No: S3511312                        #
#----------------------------------------------------------------#
#   This program is best run in a full-screen terminal to avoid  #
#    text wrapping issues which may present themselves in the    #
#            `sdiff` output on small-width screens.              #
##################################################################

use strict;

# Check that the user has passed a pair of files (two) to compare.
unless ($#ARGV>=1 && $#ARGV<=1) {
   die "ERROR: Please pass two files in to the program to compare!\n";
}

my ($file1, $file2) = @ARGV;

# Check files exist and are plain files
unless (-e $file1 && -f _ && -e $file2 && -f _) {
   die "ERROR: One of those files does not exist or is not a plain file.\n";
}

print "\nComparison of files $file1 and $file2\n";

# Get line, word, and character counts using `wc`.
my @file1_wc = getWC($file1);
my @file2_wc = getWC($file2);

# Set up table formatting information & present data
$~ = "TABLE";
$^ = "TABLE_TOP";

format TABLE_TOP =

----------------------------------------------------------
|        FILE        |   LINES   |   WORDS   |   CHARS   |
|--------------------------------------------------------|
.

format TABLE =
| @||||||||||||||||| | @|||||||| | @|||||||| | @|||||||| |
  $file1, $file1_wc[0], $file1_wc[1], $file1_wc[2]
| @||||||||||||||||| | @|||||||| | @|||||||| | @|||||||| |
  $file2, $file2_wc[0], $file2_wc[1], $file2_wc[2]
----------------------------------------------------------

.

write;

# Use diff to determine which lines differ, print only those lines
# Include line numbers on the left.
my $diffResult = `sdiff -l $file1 $file2 | cat -n | grep -v -e \'($\'`;
print "Specific lines which differ between $file1 and $file2: \n";
print "\n",$diffResult, "\n";


# ---- Sub-routines ----

sub getWC {
   my $file = shift;
   my $wordCount = `wc $file`;
   my @wordCount = split(' ', $wordCount);
}
