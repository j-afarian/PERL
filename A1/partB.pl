#!/usr/bin/env perl

##################################################################
#        Part B: Platform Independent Text File Comparer         #
##################################################################
#                    Author: Jenna Afarian                       #
#----------------------------------------------------------------#
#                    Student No: S3511312                        #
##################################################################

use File::Compare;
use List::Compare;
use strict;
use feature ':5.12';

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

# Get line, word, and character count using subroutine
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

# Determine which lines do not match between the two files.
getDiff($file1, $file2);

# ---- Sub-routines ----
sub getWC {
  my $file = shift;
  open(FILE, "<:encoding(UTF-8)", $file) or die "Could not open file: $!\n";

  my ($lines, $words, $chars) = (0,0,0);
  my @wordcounter;
  while (<FILE>) {
      $chars += length($_);
      @wordcounter = split(/\W+/, $_);
      $words += @wordcounter;
  }
  $lines = $.;
  close FILE;
  return my @wcArray = ($lines, $words, $chars);
}

sub getDiff {
  my $file1 = shift;
  my $file2 = shift;

  open (my $fh1, "<", $file1) or die $!;
  open (my $fh2, "<", $file2) or die $!;
  my @content_f1=<$fh1>;
  my @content_f2=<$fh2>;

  my $diff = List::Compare->new(\@content_f1, \@content_f2);

  print "Lines unique to $file1:\n", $diff->get_unique,"\n";
  print "Lines unique to $file2:\n", $diff->get_complement,"\n";

  close $fh1;
  close $fh2;
}
