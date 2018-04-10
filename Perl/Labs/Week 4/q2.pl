#!/usr/bin/env perl

# Question 2 - Lab 4
# Jenna Afarian - S3511312

# Write a script that will read in the contents of the /etc/passwd file and
# list out all the user's names that have the word "Smith" in their
# username or name.

# Format: username:X:uid:gid:name:homedir:shell

use warnings;
use strict;

my $file = "etc\ passwd\ file-1";
open FILE, $file or die "Cannot open $file: $!\n";

my @array;
my $line;
while ($line = <FILE>) {
   chomp($line);
   @array = split(':', $line);
   
   if($array[0] =~ /smith/i) {
      print "$array[4] contains 'smith' in the username field\n";
   }
   elsif($array[4] =~ /smith/i) {
      print "$array[4] contains 'smith' in the name field\n";
   }
}

