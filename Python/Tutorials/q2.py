#!/usr/bin/env python

# Re-write the program in quesiton 1 to move the calculation
# to it's own function.

import sys

total,count,result = 0,0,0

def calculation(num):
    global total
    global count
    global result
    total += int(num)
    count += 1
    result = float(total)/count
    

for number in sys.argv[1:]:
    calculation(number)
    print "The result is ", result
