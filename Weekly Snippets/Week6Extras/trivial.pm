package trivial;
use strict;

our $VERSION = 1.0;

sub new {
   my $self = {};
   return bless $self;
}

sub printmsg {
   print "I'm trivial\n";
}

1;
