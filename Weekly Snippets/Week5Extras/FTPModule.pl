#!/usr/bin/env perl

use warnings;
use Net::FTP;

my $ftpcon = new Net::FTP("speedtest.tele2.net");
$ftpcon->login("anonymous", "my\@address.com");

my @files = $ftpcon->dir();

foreach (@files) {
   print "$_\n";
}

# $ftpcon->get("1MB.zip");  Downloads this specific file!

$ftpcon->quit();
