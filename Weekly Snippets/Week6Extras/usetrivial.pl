#!/usr/bin/env perl

use trivial;

$obj1 = new trivial;    # Create new object
$obj2 = trivial->new;   # Same

$obj1->printmsg;        # Call object method
printmsg $obj2;         # Same

trivial->printmsg;      # Call class method
printmsg trivial;       # Same

