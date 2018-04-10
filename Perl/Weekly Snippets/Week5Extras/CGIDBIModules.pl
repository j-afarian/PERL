#!/usr/bin/env perl

use warnings;
use strict;
use DBI;
use CGI qw/:standard/;

print header;

print start_html("Order Acceptance");

my $account = param("accno");
my $book = param("isbn");
my $creditcard = param("ccard");

# Database insertion
my $dbi = DBI->connect("dbi:mysql:localhost:orders", "user", "password");

if (!defined($dbi)) {
   print "<H1>Database Connection Error!</H1>\n";
   exit;
}

my $insert = $dbi->prepare("INSERT INTO sales VALUES(NULL, $account, $creditcard, $book)");

my $chk = $insert->execute;
$dbi->disconnet();

if (! $chk) {
   print "<H1>Database Insertion Error</H1>\n";
   exit;
}


my $check = billOrder($account, $book, $creditcard); #call function to initate delivery of book

if ($check) {
   sendOrder($account, $book);

   print <<EOF;
   <H1>Your order has been placed</H1>
   It will arrive in 6-8 weeks.
EOF

   sendConfirmEmail($account, $book);
}
else {
   print <<EOF;
   <H1>Your order could not be placed </H1>
   Please try to resubmit the order.
EOF
}

print end_html;
