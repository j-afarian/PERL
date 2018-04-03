#!/usr/bin/env perl

use warnings;
use strict;
use Net::POP3;

my $pop = new Net::POP3("pophost.isp.com.au");

$pop->login("username", "password");

my $messages = $pop->list();

foreach (keys %{$messages}) {
   my $a = $pop->get($_);
   print foreach (@{$a});
}

$pop->quit();

