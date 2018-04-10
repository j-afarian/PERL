#!/usr/bin/env perl

use warnings;
use strict;
use Net::SMTP;

my $smtp = Net::SMTP->new("smtp.isp.com.au");
my $address = "user\@email.com";

$smtp->mail($ENV{'USER'});
$smtp->to($address);
$smtp->data();
$smtp->datasend("Subject: Test!");
$smtp->datasend("\n");
$smtp->datasend("This is a test");
$smtp->dataend();

$smtp->quit();

