#!/usr/bin/env perl

# Jenna Afarian - S3511312

# Write a small Perl script that will accept 3 items: 
# - An identification number
# - An item description
# - A price
#
# All values are read from STDIN.
# All 3 items along with a date of purchase, are to be written out to a text
# file in append mode.
# The format should be "date,customer,item,price" (no spaces)

my $loopControl = 0;

while ($loopControl < 1) {

   print "Enter the customer identification number:\n";
   my $id = <STDIN>;
   chomp $id;

   print "Enter the item description:\n";
   my $desc = <STDIN>;
   chomp $desc;

   print "Enter the price of the item:\n";
   my $price = <STDIN>;
   chomp $price;

   my $date = `date +"%Y-%m-%d"`;
   chomp $date;


   my $writeString = join "\,", $date, $id, $desc, $price;
  
   open my $file, ">>PurchaseLog.txt" or die "File operation failed: $!\n";
   print $file "$writeString\n";

   print "Transaction written to log.\n";

   print "To enter another item press 0, to exit press 1:\n";
   $loopControl = <STDIN>;
   
   while ($loopControl < 0 or $loopControl > 1) {
      print "Error! To enter another item press 0, to exit press 1:\n";
      $loopControl = <STDIN>;
   }
}

