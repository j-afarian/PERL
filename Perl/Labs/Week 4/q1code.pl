#!/usr/bin/env perl

use warnings; use strict;

my $file = "input.txt";
open FILE, $file or die "Cannot open $file: $!";

my $line;
while ($line = <FILE>) {
   print $line;
}

