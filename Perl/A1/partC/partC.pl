#!/usr/bin/env perl

##################################################################
#              Part B: Advanced Text File Comparer               #
##################################################################
#                    Author: Jenna Afarian                       #
#----------------------------------------------------------------#
#                    Student No: S3511312                        #
#----------------------------------------------------------------#
#  Regex for URL was built with help from the following sorces:  #
#                     http://urlregex.com/                       #
#       https://www.webmasterworld.com/perl/3956870.htm          #
##################################################################

use strict;
use File::Compare;
use List::Compare;
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

# Remove HTML from the files
#s/<.*?>//g
  # open my $fh, $file1 or die "File operation failed: $!\n";
  # while (my $line = <$fh>) {
  #    chomp $line;
  #    $line =~ s/<.*?>//g;
  #    print $line;
  # }
  # close $file1;

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
      $_ =~ s/<.*?>//g;
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

  foreach my $line (@content_f1) {
    $line =~ s/<.*?>//g;
    $line =~ s/(http(s?)\:\/\/)?www\..*\.(com|net|org|biz|info|us|uk)\s/\n/gi;
  }

  foreach my $line (@content_f2) {
    $line =~ s/<.*?>//g;
    $line =~ s/(http(s?)\:\/\/)?www\..*\.(com|net|org|biz|info|us|uk)\s/\n/gi;
  }

  my $diff = List::Compare->new(\@content_f1, \@content_f2);

  print "Lines unique to $file1:\n", $diff->get_unique,"\n";
  print "Lines unique to $file2:\n", $diff->get_complement,"\n";

  close $fh1;
  close $fh2;
}
