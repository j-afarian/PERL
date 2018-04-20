#!/usr/bin/env python

import sys

total, count = 0,0

for number in sys.argv[1:]:
    total += int(number)
    count += 1
    print "The result is ", float(total)/count


# Tutorial Questions

# -- What does it do? --
# Takes a number of inputs from the command-line and adds each 
# one to the total. The total is then divided by the count.
# ./q1.py 2 3 4 would result in 2/1 = 2, 5/2 = 2.5, 9/3 = 3.

# -- What does sys.argv[1:] mean? Why do we need the [1:] --
# sys.argv is a list of arguments, the [1:] is a list slice, 
# starting at 1 and continuing until the end of the list.

# --How would its behaviour change if we replaced float(total)/count
# with float(total/count) in the last line? Why? --
# Any decimals would be removed because the "total/count" would be
# evaluated first. Since total is an int, 5/2=2. It would then be
# converted to a float resulting in 2.0 rather than 2.5.

