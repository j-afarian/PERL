#!/usr/bin/env perl

use warnings;
use strict;
use MIME::Entity;

my $destination = "jenna.afarian\@hotmail.com";
my $message = "This is a test email from Perl";
my $date = localtime();

my $top = build MIME::Entity Type => "multipart/mixed",
From => "s3511312\@student.rmit.edu.au",
To => "$destination",
Subject => "Message dated $date";

attach $top Path => "cactus.gif",           # add a GIF file
Type => "image/gif",
Encoding => "base64";

attach $top Data => $message;                       # addin some literal text

open MAIL, "| /usr/sbin/sendmail -t -i" or die "open: $!"; 

$top->print(\*MAIL);                                # reference to the filehandle
close MAIL;


