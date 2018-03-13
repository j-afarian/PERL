#!/usr/bin/env perl

# Jenna Afarian - S3511312

# Write a Perl script that returns the first non-repeating character in a string.
# For example: "Proprietary order", "i" is the first non-repeating character.

use List::MoreUtils qw(singleton);

my $string = "One dark and gloomy night";

$string = lc($string);
chomp $string;

my ($first) = singleton split//, $string;
print "$first\n";
