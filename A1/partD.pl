#!/usr/bin/env perl

##################################################################
#            Part D: Text File Similarity Measurement            #
##################################################################
#                    Author: Jenna Afarian                       #
#----------------------------------------------------------------#
#                    Student No: S3511312                        #
##################################################################

use Text::Similarity::Overlaps;
use strict;

# Check that the user has passed two files in to compare.
unless ($#ARGV>=1 && $#ARGV<=1) {
   die "ERROR: Please pass two files in to calculate the similarity\n";
}

my ($file1, $file2) = @ARGV;

# Check files exist and are plain files
unless (-e $file1 && -f _ && -e $file2 && -f _) {
   die "ERROR: One of those files does not exist or is not a plain file.\n";
}

# Get the Similarity Overlaps score for the two files
my $mod = Text::Similarity::Overlaps->new;
defined $mod or die "Construction of Text::Similarity::Overlaps failed";

my $score = $mod->getSimilarity ($file1, $file2);

# Work out how many words are in the largest file
my @file1_wc = getWC($file1);
my @file2_wc = getWC($file2);
my $largest = 0;

if ($file1_wc[1] > $file2_wc[1]) {
  $largest = $file1_wc[1];
}
else {
  $largest = $file2_wc[1];
}

# Workout percentage of overlap with score/largest*100
my $similarity = $score/$largest*100;
$similarity = sprintf("%.2f", $similarity);
print "The percentage of similarity between $file1 and $file2 is $similarity\%\n";

# ---- Sub-routines ----
sub getWC {
   my $file = shift;
   my $wordCount = `wc $file`;
   my @wordCount = split(' ', $wordCount);
}
