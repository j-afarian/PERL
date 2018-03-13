#!/usr/bin/env perl

# Jenna Afarian - S3511312

# Create an array of values, and write a Perl script to determine
# if there are any duplicate values in the array.

my @array = ("kitty", 
   "puppy", 
   "mouse", 
   "kitty", 
   "fish",
   "puppy",
   "turtle");

my %hash;

foreach my $animal (@array) {
   $hash{$animal}++;
};

foreach my $key (sort keys %hash) {
   print "$key: $hash{$key}\n";
}
