#!/usr/bin/env perl

use warnings;
use strict;
use Switch;

# W2 Tutorial Question 2
# Day of the week date generator

my $firstMonday = int(rand(7) +1);
print "Enter a number between 1 and 31 to generate the day of the week:\n";
my $date = <STDIN>;

while ($date < 1 or $date > 31) {
   print "Error, enter a number between 1 and 31:\n";
   $date = <STDIN>;
}

chomp $date;

#Tell the user which day number the first Monday lands on
print "\nThe first Monday lands on day number $firstMonday.\n";

if ($date > 28) {
  print "WARNING: $date might not be valid in the current month!\n";
}

my $dayNumber = 0;

if ($firstMonday == $date) {
   print "$date is a Monday!\n";
}
else {
   $dayNumber = ($date - $firstMonday) % 7;

   switch ($dayNumber) {
      case 0 {
         print "$date is a Monday.\n";
      }
      case 1 {
         print "$date is a Tuesday.\n";
      }
      case 2 {
         print "$date is a Wednesday.\n";
      }
      case 3 {
         print "$date is a Thursday.\n";
      }
      case 4 {
         print "$date is a Friday.\n";
      }
      case 5 {
         print "$date is a Saturday.\n";
      }
      case 6 {
         print "$date is a Sunday.\n";
      }
      else {
         print "This doesn't seem right...\n";
      }
   }
}
