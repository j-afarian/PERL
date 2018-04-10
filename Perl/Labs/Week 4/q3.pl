#!/usr/bin/env perl

# Question 3 - Lab 4
# Jenna Afarian - S3511312

# Refactored Week 3 lab to use subroutines.

my $loopControl = 1;

while ($loopControl == 1) {

   writeToFile(userInput());

   promptUser();
   
   while ($loopControl != 1 and $loopControl != 2) {
      print "Error!: ";
      promptUser();
   }
}


# ----------- SUBROUTINES -----------
sub userInput {
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
}

sub writeToFile {
   open my $file, ">>PurchaseLog.txt" or die "File operation failed: $!\n";
   print $file "@_[0]\n";

   print "Transaction written to log.\n";
}

sub promptUser {
   print "To enter another item press 1, to exit press 2:\n";
   $loopControl = <STDIN>;
}

