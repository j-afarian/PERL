#!/usr/bin/env perl

# Part A: Text File Comparer
# Jenna Afarian - S3511312

unless ($#ARGV>=1) {
   die "Please pass at least 2 files into the program!\n";
}

my $numArgs = $#ARGV + 1;

# Create file handles from the command line argument files 
# and store them in an array called "fileHandles"
my @fileHandles;

for my $fileName (@ARGV) {
   open $fileHandles[@fileHandles], '<', $fileName 
      or die "can't open $fileName: $!\n";
}

print @fileHandles, "\n";

while (@fileHandles) {
   for my $file (@fileHandles) {
      my $line = <$file>;

      if (! defined $line) {
         # End of file
         close $file;
         $file = undef;
         next;
      }
      
      print "$line";
   }
   @fileHandles = grep {defined} @fileHandles;
}

print "loop over\n";

   
   # foreach my $line (@contents) {
   #   print "$line";
   #}
#}


#while (@fileHandles) {
#   for my $file (@fileHandles) {
#      my $line = <$file>;
#      print $line, "\n";
#   }
#}

   
   
